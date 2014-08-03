json.array!(@companies) do |company|
  json.extract! company, :id, :name, :service_id, :location, :phone_number
  json.url company_url(company, format: :json)
end
