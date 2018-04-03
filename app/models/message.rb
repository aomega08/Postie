# frozen_string_literal: true

# A message represent an email to be sent or sent
class Message < ApplicationRecord
  after_commit :deliver, on: :create

  has_many :message_recipients, dependent: :delete_all
  has_many :recipients, through: :message_recipients
  has_many :message_tags, dependent: :delete_all
  has_many :tags, through: :message_tags

  validates :from, presence: true

  def build_recipients(data)
    data.each do |item|
      # Find a known recipient given the email. Create it with the name if missing.
      recipient = Recipient.create_with(name: item[:name]).find_or_create_by(email: item[:email])

      # Set the name on an existing record missing it.
      recipient.update(name: item[:name]) if recipient.name.blank?

      # Build the MessageRecipient object.
      message_recipients.build(recipient: recipient, name: item[:name], recipient_type: item[:type].presence || :to)
    end
  end

  def deliver
    MessageDeliverer.new(self).deliver
  end

  def headers
    JSON.parse(self[:headers])
  end

  def from_header
    if from_name.present?
      "#{from_name} <#{from}>"
    else
      from
    end
  end

  def to_header
    message_recipients.to.map(&:to_header).join(', ')
  end

  def cc_header
    message_recipients.cc.map(&:to_header).join(', ')
  end

  def recipient_emails
    recipients.map(&:email).uniq
  end
end
