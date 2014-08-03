require "sms_gateway"
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def generate_verification_code
    cs = [*'0'..'9']
    6.times.map { cs.sample }.join.upcase
  end

  def send_verification_code user
  	gateway = SMSGateway.new
  	code = generate_verification_code
  	gateway.send user.phone_number, "Hi. Welcome to the Nyumba Kumi Initiative. 
  			Your verification code is #{code}. Go back to the app and enter it."

  	user.verification_code = code
  	user.save!
  end
end
