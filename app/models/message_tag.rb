# frozen_string_literal: true

# The link between a message and a tag
class MessageTag < ApplicationRecord
  belongs_to :message
  belongs_to :tag
end
