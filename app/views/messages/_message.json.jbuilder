#json.extract! message, :id, :created_at, :updated_at
#json.url message_url(message, format: :json)

json.id message.id
json.title message.title
json.sender message.sender
json.receiver message.receiver
json.body message.body
