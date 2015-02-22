json.array!(@incidents) do |incident|
  json.extract! incident, :id, :incident_type, :user_id, :notification_id, :location, :resolved, :false_flag
  json.(incident.user, :name, :phone_number)
  json.url incident_url(incident, format: :json)
end
