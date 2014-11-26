class DashboardController < ApplicationController
	before_action :authenticate_account!
	layout 'dashboard'
  def index
  end

  def map
  	render layout: 'map'
  end
end
