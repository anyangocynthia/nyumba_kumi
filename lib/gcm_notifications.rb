require 'gcm'
class GCMNotifications

  def initialize
    @api_key = ENV['GOOGLE_API_KEY']
    @project_number = ENV['GOOGLE_PROJECT_NUMBER']
  end

  def send registration_ids, data, collapse_key
    gcm = GCM.new(@api_key)

    # registration_ids= ["12", "13"] # an array of one or more client registration IDs
    # options = {data: {score: "123"}, collapse_key: "updated_score"}
    # {"registration_ids" : [registration_id1, registration_id2], {data: {message: "hey"}, collapse_key: "New Notification"}}
    options = {data: data, collapse_key: collapse_key}
    if Rails.env.production?
      response = gcm.send(registration_ids, options)
    else
      response = "We are in developement mode"
    end
    response
  end

  def create
    gcm = GCM.new(@api_key)
    gcm.create(key_name: "appUser-Chris", project_id: "my_project_id", registration_ids:["4", "8", "15", "16", "23", "42"])
  end
end