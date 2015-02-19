json.array!(@attendees) do |attendee|
  json.extract! attendee, :id, :event_id, :contact_id
  json.url attendee_url(attendee, format: :json)
end
