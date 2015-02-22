class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout 'dashboard', except: [:map]
  def index
  	# render layout: 'dashboard'
  end

  def map
  	render layout: 'map'
  end

  def blog
  	@articles = Article.all
  end
end
