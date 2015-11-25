json.array!(@chat_entries) do |chat_entry|
  json.extract! chat_entry, :id, :name, :content
  json.url chat_entry_url(chat_entry, format: :json)
end
