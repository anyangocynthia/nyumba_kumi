class HomeController < ApplicationController

	def sign_up
		phone_number = params[:number]
		user = User.find_or_create_by_phone_number! phone_number: phone_number
		profile_setup = !(user.id_number.nil? || user.name.nil?)
		is_in_a_group = !Member.find_by_user_id(user.id).nil?
		render json: { is_in_a_group: is_in_a_group, profile_setup: profile_setup }
	end

	def add_members
		phone_number = params[:number]
		user = User.find_or_create_by_phone_number! phone_number: phone_number
		is_in_a_group = !Member.find_by_user_id(user.id).nil?
		render json: { is_in_a_group: is_in_a_group }
	end
end
