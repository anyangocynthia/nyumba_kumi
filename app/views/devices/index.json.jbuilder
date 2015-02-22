json.array!(@devices) do |device|
  json.extract! device, :id, :contact_id, :registration_id
  json.url device_url(device, format: :json)
end
