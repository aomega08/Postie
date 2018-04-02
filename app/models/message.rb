# frozen_string_literal: true

# A message represent an email to be sent or sent
class Message < ApplicationRecord
  has_many :message_recipients, dependent: :delete_all
  has_many :recipients, through: :message_recipients
  has_many :message_tags, dependent: :delete_all
  has_many :tags, through: :message_tags

  validates :from, presence: true
end