# frozen_string_literal: true

# A tag is a custom value attached to a message, usually used for categorisation.
class Tag < ApplicationRecord
  has_many :message_tags, dependent: :delete_all
  has_many :messages, through: :message_tags

  validates :name, presence: true
end
