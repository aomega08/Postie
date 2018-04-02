# frozen_string_literal: true

# A recipient represents a single email address. A name can be attached.
class Recipient < ApplicationRecord
  has_many :message_recipients, dependent: :delete_all
  has_many :messages, through: :message_recipients

  validates :email, presence: true
end
