# frozen_string_literal: true

json.data do |json|
  json.from message.from
  json.from_name message.from_name
  json.subject message.subject
  json.headers message.headers

  json.recipients message.message_recipients do |item|
    json.email item.recipient.email
    json.name item.name.presence || item.recipient.name
    json.type item.recipient_type
  end

  json.content message.content
  json.html_content message.html_content
end
