json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :user_id, :setup, :api_token
  json.url account_url(account, format: :json)
end
