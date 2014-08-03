json.array!(@group_companies) do |group_company|
  json.extract! group_company, :id, :group_id, :company_id, :company_type, :branch_id
  json.url group_company_url(group_company, format: :json)
end
