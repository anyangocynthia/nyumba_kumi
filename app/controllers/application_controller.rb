require "sms_gateway"
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  set_current_tenant_through_filter
  before_filter :filter_tenant_via_devise_or_params

  def filter_tenant_via_devise_or_params 
    if user_signed_in?
      account = current_user.main_account
      set_current_tenant(account)
    elsif params[:account].present?
      account = Account.find_by_email(params[:account])
      set_current_tenant(account)
    elsif params[:token].present?
      # possibly an API client
      account = Account.find_by_api_token(params[:token])
      set_current_tenant(account)
    else
      # token authentication via API
      authenticate_with_http_token do |token|        
        account = Account.find_by_api_token(token)
        set_current_tenant(account)
      end
    end
  end

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
    new_user_session_path
  end

  def after_sign_up_path_for(resource)
    new_company_path
  end

  def account
    ActsAsTenant.current_tenant
  end

  # def resource_name
  #   @resource_name = :user
  # end

  # def resource
  #   @resource ||= User.new
  # end

  # def devise_mapping
  #  @devise_mapping ||= Devise.mappings[:user]
  # end

  def send_verification_code contact
    gateway = SMSGateway.new
    code = generate_verification_code
    gateway.send contact.phone_number, "Hi. Welcome to Ujirani app. Your verification code is #{code}. Go back to the app and enter it."

    contact.verification_code = code
    contact.save!
  end
end
