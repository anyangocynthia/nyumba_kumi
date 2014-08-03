class SessionsController < ApplicationController
  respond_to :json
  
  def create
    user = User.find_by(phone_number: params[:phone_number])
    
    if user
      session[:user_id] = user.id
      render json: {user_id: user.id, phone_number: user.phone_number, user_role: user.role_name, message: "You are logged in", status: :success}
    else
      render json: {message: "Phone Number is invalid", status: :unprocessable_entity}
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "You are logged out", status: :success}
  end
end
