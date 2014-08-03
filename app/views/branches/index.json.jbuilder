json.array!(@branches) do |branch|
  json.extract! branch, :id, :company_id, :phone_number, :latitude, :longitude
  json.url branch_url(branch, format: :json)
end
