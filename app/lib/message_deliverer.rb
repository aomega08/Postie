# frozen_string_literal: true

require 'net/smtp'
require 'resolv'

# Connects to an SMTP server and delivers the message
class MessageDeliverer
  def initialize(message)
    @message = message
    @builder = MessageBuilder.new(message)
  end

  def deliver
    targets = message.recipient_emails
    mxs = group_by_mx(targets)
    mxs.each { |mx, rcpt_to| deliver_to(mx, rcpt_to) }
  end

  private

  attr_reader :message

  def group_by_mx(recipients)
    hosts = recipients.map { |r| r.split('@')[1] }.uniq

    hosts.map { |host| [mx_for(host), filter_targets(recipients, host)] }.to_h
  end

  # Try to resolve the MX record for the domain.
  # Falls back to the host itself if no result is found: it may be an IPv4 or
  # IPv6 address. If it's not, and no MX record actually exists, it will just
  # fail later.
  # When multiple MXs are available, take the first one. The DNS server is
  # already responding in a random order. No need to load balance ourself.
  def mx_for(host)
    Resolv::DNS.open do |dns|
      return host if Rails.env.test? # Save some testing time and networking

      response = dns.getresources(host, Resolv::DNS::Resource::IN::MX)
      response.map(&:exchange).map(&:to_s).first || host
    end
  end

  def filter_targets(targets, host)
    targets.select { |target| target.ends_with?("@#{host}") }
  end

  def deliver_to(mx, rcpt_to)
    client = smtp_client(mx)

    if Rails.env.production?
      client.start do |smtp|
        smtp.send_message(@builder.body, message.from, rcpt_to)
      end
    else
      log_nonprod_delivery(mx, rcpt_to, @builder.body)
    end
  end

  def log_nonprod_delivery(mx, rcpt_to, body)
    Rails.logger.info("Email delivery is disabled in #{Rails.env} environment.")
    Rails.logger.info("Skipping sending emails to #{rcpt_to.join(', ')} through MX #{mx}.")
    Rails.logger.debug('Message content:')
    body.split("\r\n").each { |line| Rails.logger.debug(line) }
  end

  def smtp_client(mx)
    client = Net::SMTP.new(mx)
    client.open_timeout = 2
    client
  end
end
