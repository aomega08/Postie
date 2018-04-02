# frozen_string_literal: true

# The link between a message and an email address. It specifies the recipient
# type (to, cc, bcc) and an eventual name override.
class MessageRecipient < ApplicationRecord
  belongs_to :message
  belongs_to :recipient

  enum recipient_type: %i[to cc bcc]
end
