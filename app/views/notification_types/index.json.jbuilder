json.array!(@notification_types) do |notification_type|
  json.extract! notification_type, :id, :name
  json.url notification_type_url(notification_type, format: :json)
end
