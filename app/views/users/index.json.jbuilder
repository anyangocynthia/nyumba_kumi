json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone_number, :id_number, :group_id, :user_type
  json.url user_url(user, format: :json)
end
