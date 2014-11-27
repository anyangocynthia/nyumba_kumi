require "sms_gateway"
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def generate_verification_code
    cs = [*'0'..'9']
    6.times.map { cs.sample }.join.upcase
  end

  def after_sign_in_path_for(res)
    map_path
  end

  def after_sign_out_path_for(arg)
    new_account_session_path
  end

  def after_sign_up_path_for(resource)
    new_company_path
  end

  def send_verification_code user
    gateway = SMSGateway.new
    code = generate_verification_code
    gateway.send user.phone_number, "Hi. Welcome to Ujirani app. Your verification code is #{code}. Go back to the app and enter it."

    user.verification_code = code
    user.save!
  end
end
