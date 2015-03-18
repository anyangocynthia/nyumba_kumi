module Api::V2
	class EstatesController < ApplicationController
		def nearby_estates
			render json: Estate.find_nearest(params[:latitude], params[:longitude], 20)
		end

		def index
			rendor json: Estate.all
		end
	end
end