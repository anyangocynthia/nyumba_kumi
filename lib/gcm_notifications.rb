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
     options = {data: data, collapse_key: collapse_key}
     response = gcm.send(registration_ids, options)
    end
end