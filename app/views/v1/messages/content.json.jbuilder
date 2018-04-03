# frozen_string_literal: true

json.data do |json|
  json.id message.id
  json.headers message.headers
  json.content message.content
  json.html_content message.html_content
end
