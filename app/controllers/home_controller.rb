require 'sms_gateway'
class HomeController < ApplicationController

	def sign_up
		phone_number = params[:number]
		user = User.find_or_create_by! phone_number: phone_number
		profile_setup = !(user.id_number.nil? || user.name.nil?)
		is_in_a_group = !user.group_id.nil?
		verified = !user.verified.nil?

		if verified == false
			send_verification_code user
		end
		render json: { user_id: user.id, is_in_a_group: is_in_a_group, profile_setup: profile_setup, verified: verified }
	end

	def add_members
		# users = [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]
		# params = {"group" => group_id, users => users}
		gateway = SMSGateway.new
		group_name = Group.find(params[:group]).group_name
		# group_admin = Group.find(params[:group]).user.name
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
				user.save!
				# send invitation SMS to user
				# gateway.send user.phone_number, "Hi. You have been added to the Nyumba Kumi group #{group_name} by #{group_admin}. Please click {{link}} to download the app."
				not_in_a_group << phone_number
			end
		end
		render json: { in_a_group: in_a_group, not_in_a_group: not_in_a_group }
	end

	def add_services
		# params = {group_id: 1, services: [[service_id, company_id], [service_id, company_id]]}
		services = params[:services]
		services.each do |service|
			service_name = Service.find(service[0]).name
			GroupCompany.create! group_id: params[:group_id], company_id: service[1], company_type: service_name
		end
		render json: { success: true }
	end
end
