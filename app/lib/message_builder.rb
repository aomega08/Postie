# frozen_string_literal: true

# Constructs and SMTP data string from a Message.
class MessageBuilder
  def initialize(message)
    @message = message
  end

  def body
    @body ||= build.to_s
  end

  def build
    mail = Mail.new(
      from: message.from_header,
      to: message.to_header,
      subject: message.subject,
      'Cc': message.cc_header
    )

    add_headers(mail)
    add_content(mail)
    mail
  end

  private

  attr_reader :message

  def add_headers(mail)
    message.headers.each do |k, v|
      mail.header[k] = v
    end
  end

  def add_content(mail)
    add_plain_content(mail)
    add_html_content(mail)
  end

  def add_plain_content(mail)
    return if message.content.blank?

    mail.text_part = Mail::Part.new(
      body: message.content
    )
  end

  def add_html_content(mail)
    return if message.html_content.blank?

    mail.html_part = Mail::Part.new(
      body: message.html_content, content_type: 'text/html; charset=UTF-8'
    )
  end
end
