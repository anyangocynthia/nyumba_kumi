module Api::V1
	class ServicesController < ApiController
		def companies
		    render json: Service.find(params[:id]).companies
	  end

	  def services_and_companies
	    services_and_companies = {}
	    Service.all.each do |service|
	      services_and_companies[service.name] = service.companies
	    end
	    render json: services_and_companies
	  end
	end
end