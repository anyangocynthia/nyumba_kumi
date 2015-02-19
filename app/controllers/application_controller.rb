require "sms_gateway"
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  helper_method :current_contact

  def current_contact
    @current_contact ||= Contact.find(session[:contact_id]) if session[:contact_id]
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

  # def resource_name
  #   @resource_name = :account
  # end

  # def resource
  #   @resource ||= Account.new
  # end

  # def devise_mapping
  #  @devise_mapping ||= Devise.mappings[:account]
  # end

  def send_verification_code contact
    gateway = SMSGateway.new
    code = generate_verification_code
    gateway.send contact.phone_number, "Hi. Welcome to Ujirani app. Your verification code is #{code}. Go back to the app and enter it."

    contact.verification_code = code
    contact.save!
  end
end
