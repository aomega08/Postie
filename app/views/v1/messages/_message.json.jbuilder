# frozen_string_literal: true

json.id message.id
json.created_at message.created_at.to_i
json.from message.from
json.from_name message.from_name
json.subject message.subject

json.recipients message.message_recipients do |item|
  json.email item.recipient.email
  json.name item.name.presence || item.recipient.name
  json.type item.recipient_type
end

json.tags message.tags.map(&:name)
