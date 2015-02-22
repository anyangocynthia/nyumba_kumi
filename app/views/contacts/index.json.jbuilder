json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :phone_number, :id_number, :group_id, :contact_type
  json.url contact_url(contact, format: :json)
end
