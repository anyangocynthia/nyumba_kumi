json.array!(@appartments) do |appartment|
  json.extract! appartment, :id
  json.url appartment_url(appartment, format: :json)
end
