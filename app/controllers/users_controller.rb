class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :verify]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    user = {}
    user[:id] = @user.id
    user[:name] = @user.name
    user[:phone_number] = @user.phone_number
    user[:group_id] = @user.group_id
    user[:in_a_group] = !@user.group_id.nil?
    user[:user_type] = @user.user_type
    user[:member_since] = "#{@user.created_at.strftime("%d/%m/%Y")} #{@user.created_at.strftime("%I:%M%p")}"

    render json: user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: { id: @user.id.to_i, status: "success" } }
      else
        format.html { render :new }
        format.json { render json: { id: @user.id.to_i, status: "failure" } }
      end
    end
  end

  def verify
    code = params[:verification_code]
    if @user.verification_code == code
      @user.verified == true
      @user.verified.save!
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      user = {}
      user[:id] = @user.id
      user[:name] = @user.name
      user[:phone_number] = @user.phone_number
      user[:group_id] = @user.group_id
      user[:user_type] = @user.user_type
      user[:member_since] = "#{@user.created_at.strftime("%d/%m/%Y")} #{@user.created_at.strftime("%I:%M%p")}"

      render json: user
    else
      render json: { status: "FAIL"}
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone_number, :id_number, :group_id, :user_type, :verified, :verification_code, :house_id, :house_number)
    end
end
