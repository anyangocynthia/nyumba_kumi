json.array!(@notifications) do |notification|
  json.extract! notification, :id, :contact_id, :group_id, :notification_type_id
  json.url notification_url(notification, format: :json)
end
