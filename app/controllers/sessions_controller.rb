class SessionsController < ApplicationController
  respond_to :json
  
  def create
    contact = Contact.find_by(phone_number: params[:phone_number])
    
    if contact
      session[:contact_id] = contact.id
      render json: {contact_id: contact.id, phone_number: contact.phone_number, contact_role: contact.role_name, message: "You are logged in", status: :success}
    else
      render json: {message: "Phone Number is invalid", status: :unprocessable_entity}
    end
  end

  def destroy
    session[:contact_id] = nil
    render json: {message: "You are logged out", status: :success}
  end
end
