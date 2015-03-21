module Api::V2
  class ApiController < ApplicationController
    include SecureAccess    
    # before_filter :restrict_access
    protect_from_forgery with: :null_session

    private
      def logged_in_user
        User.where(is_support: true).first
      end
  end
end