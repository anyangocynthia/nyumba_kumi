class DashboardController < ApplicationController
	before_action :authenticate_account!
	# layout 'dashboard'
  def index
  	render layout: 'dashboard'
  end

  def map
  	render layout: 'map'
  end
end
