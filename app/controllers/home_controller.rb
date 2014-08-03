require 'sms_gateway'
class HomeController < ApplicationController

	def sign_up
		phone_number = params[:number]
		user = User.find_or_create_by_phone_number! phone_number: phone_number
		profile_setup = user.id_number.nil? && user.name.nil?
		is_in_a_group = !user.group_id.nil?
		verified = !user.verified.nil?

		if verified == false
			send_verification_code user
		end
		render json: { user_id: user.id, is_in_a_group: is_in_a_group, profile_setup: profile_setup, verified: verified }
	end

	def add_members
		# users = [{name: "254722772838", phone_number: "John Doe"}, {name: "254722772832", phone_number: "Jane Doe"}]
		# params = {"group" => group_id, users => users}
		gateway = SMSGateway.new
		group_name = Group.find(params[:group]).name
		group_admin = Group.find(params[:group]).user.name
		users = params[:users]
		in_a_group = []
		not_in_a_group = []
		users.each do |u|
			phone_number = u[:phone_number]
			name = u[:name]
			user = User.find_or_create_by_phone_number! phone_number: phone_number, name: name
			is_in_a_group = !user.group_id.nil?
			if is_in_a_group
				in_a_group << phone_number
			else
				user.group_id = params[:group]
				user.save!
				# send invitation SMS to user
				gateway.send user.phone_number, "Hi. You have been added to the Nyumba Kumi group #{group_name} by #{group_admin}. Please click {{link}} to download the app."
				not_in_a_group << phone_number
			end
		end
		render json: { in_a_group: in_a_group, not_in_a_group: not_in_a_group }
	end
end
