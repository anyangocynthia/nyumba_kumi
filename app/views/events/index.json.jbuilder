json.array!(@events) do |event|
  json.extract! event, :id, :title, :time_of_event, :venue, :description
  json.url event_url(event, format: :json)
end
