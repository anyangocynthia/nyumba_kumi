json.array!(@appartment_residents) do |appartment_resident|
  json.extract! appartment_resident, :id
  json.url appartment_resident_url(appartment_resident, format: :json)
end
