require "gcm_notifications"
module Api::V1
	class NotificationsController < ApiController
		def create
		  gcm = GCMNotifications.new
		  @notification = Notification.new(notification_params)

		  respond_to do |format|
		    if @notification.save
		      # registration_ids = @notification.group.contacts.collect {|contact| contact.devices.collect {|device| device.registration_id}}[0]
		      registration_ids = []
		      contacts = @notification.group.contacts - [@notification.contact]
		      contacts.each do |u|
		       u.devices.each do |d|
		         registration_ids << d.registration_id
		       end
		      end

		      data = {message: @notification.message, sender: @notification.contact.name}
		      gcm.send registration_ids, data, "New notification"
		      format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
		      format.json { render json: { id: @notification.id.to_i, status: "success" } }
		    else
		      format.html { render :new }
		      format.json { render json: @notification.errors, status: :unprocessable_entity }
		    end
		  end
		end
	end
end