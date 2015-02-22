require 'sms_gateway'
class HomeController < ApplicationController

	def index
		@user = User.new
	end

	def sign_up
		gateway = SMSGateway.new
		phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(params[:number]), country_number: "254"
		contact = Contact.find_or_create_by! phone_number: phone_number
		if params[:registration_id]
			Device.find_or_create_by! registration_id: params[:registration_id], contact_id: contact.id
		end
		profile_setup = !(contact.id_number.nil? || contact.name.nil?)
		is_in_a_group = !contact.group_id.nil?
		verified = contact.verified == true

		if verified == false
			if contact.verification_code.nil?
				send_verification_code contact
			else
				gateway.send(contact.phone_number, "We had already sent you the verification code. Here it is again: #{contact.verification_code}.")
			end
		end
		render json: { contact_id: contact.id, is_in_a_group: is_in_a_group, profile_setup: profile_setup, verified: verified, verification_code: contact.verification_code }
	end

	def add_members
		# contacts = [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]
		# params = {"group" => group_id, contacts => contacts}
		gateway = SMSGateway.new
		group_name = Group.find(params[:group]).group_name
		group_admin = Group.find(params[:group]).contact.name
		contacts = params[:contacts]
		in_a_group = []
		not_in_a_group = []
		contacts.each do |u|
			name = u[:name]
			phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(u[:phone_number]), country_number: "254"
			contact = Contact.find_or_create_by! phone_number: phone_number, name: name
			is_in_a_group = !contact.group_id.nil?
			if is_in_a_group
				in_a_group << phone_number
			else
				contact.group_id = params[:group]
				contact.contact_type = "Member"
				contact.save!

				gateway.send contact.phone_number, "Hi. You have been added to the group #{group_name} in the Ujirani app by #{group_admin}. Please click http://goo.gl/XeBk2c to download the app."
				not_in_a_group << phone_number
			end
		end
		render json: { in_a_group: in_a_group, not_in_a_group: not_in_a_group }
	end

	def add_services
		# {"services"=>[{"service_id"=>"1", "company_id"=>"1"}, {"service_id"=>"3", "company_id"=>"10"}, {"service_id"=>"2", "company_id"=>"3"}], "home"=>{"services"=>[{"service_id"=>"1", "company_id"=>"1"}
		services = params[:services]
		if !services.nil?
			services.each do |service|
				service_name = Service.find(service[:service_id]).name
				GroupCompany.create! group_id: params[:group_id], company_id: service[:company_id], company_type: service_name
			end
		end
		render json: { success: true }
	end

	def panic_menu_actions
		notification_type = NotificationType.find_by name: params[:service]
		if !notification_type.nil?
			contact = Contact.find(params[:contact_id])
			notification = Notification.create! contact_id: params[:contact_id], group_id: contact.group.id, notification_type_id: notification_type.id, message: notification_type.alert_message
			company = contact.group.group_companies.where(company_type: params[:service]).first.company
			Incident.create! incident_type: notification_type.name, contact_id: params[:contact_id], notification_id: notification.id, location: params[:location], company_id: company.id
			render json: {group: notification.group.id, service: params[:service], location: params[:location], message: notification.message}
		else
			render json: {error: "Unknown request!"}
		end
	end
end
