require 'sms_gateway'
class HomeController < ApplicationController

	def index
		
	end

	def sign_up
		gateway = SMSGateway.new
		phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(params[:number]), country_number: "254"
		user = User.find_or_create_by! phone_number: phone_number
		if params[:registration_id]
			Device.find_or_create_by! registration_id: params[:registration_id], user_id: user.id
		end
		profile_setup = !(user.id_number.nil? || user.name.nil?)
		is_in_a_group = !user.group_id.nil?
		verified = user.verified == true

		if verified == false
			if user.verification_code.nil?
				send_verification_code user
			else
				gateway.send(user.phone_number, "We had already sent you the verification code. Here it is again: #{user.verification_code}.")
			end
		end
		render json: { user_id: user.id, is_in_a_group: is_in_a_group, profile_setup: profile_setup, verified: verified, verification_code: user.verification_code }
	end

	def add_members
		# users = [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]
		# params = {"group" => group_id, users => users}
		gateway = SMSGateway.new
		group_name = Group.find(params[:group]).group_name
		group_admin = Group.find(params[:group]).user.name
		users = params[:users]
		in_a_group = []
		not_in_a_group = []
		users.each do |u|
			phone_number = u[:phone_number]
			name = u[:name]
			user = User.find_or_create_by! phone_number: phone_number, name: name
			is_in_a_group = !user.group_id.nil?
			if is_in_a_group
				in_a_group << phone_number
			else
				user.group_id = params[:group]
				user.user_type = "Member"
				user.save!
<<<<<<< HEAD
				send invitation SMS to user
				gateway.send user.phone_number, "Hi. You have been added to #{group_name} in the Ujirani app by #{group_admin}. Please click {{link}} to download the app."
=======
				# send invitation SMS to user
				gateway.send user.phone_number, "Hi. You have been added to the Nyumba Kumi group #{group_name} by #{group_admin}. Please click https://play.google.com/store/search?q=ujirani&c=apps&hl=en to download the app."
>>>>>>> 866012fe3bd95731a22b1bac81f2b14ea2b36310
				not_in_a_group << phone_number
			end
		end
		render json: { in_a_group: in_a_group, not_in_a_group: not_in_a_group }
	end

	def add_services
		# {"services"=>[{"service_id"=>"1", "company_id"=>"1"}, {"service_id"=>"3", "company_id"=>"10"}, {"service_id"=>"2", "company_id"=>"3"}], "home"=>{"services"=>[{"service_id"=>"1", "company_id"=>"1"}
		services = params[:services]
		services.each do |service|
			service_name = Service.find(service[:service_id]).name
			GroupCompany.create! group_id: params[:group_id], company_id: service[:company_id], company_type: service_name
		end
		render json: { success: true }
	end
end
