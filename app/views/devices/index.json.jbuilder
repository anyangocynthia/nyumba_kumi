json.array!(@devices) do |device|
  json.extract! device, :id, :user_id, :registration_id
  json.url device_url(device, format: :json)
end
