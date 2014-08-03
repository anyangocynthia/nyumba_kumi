class NotificationTypesController < ApplicationController
  before_action :set_notification_type, only: [:show, :edit, :update, :destroy]

  # GET /notification_types
  # GET /notification_types.json
  def index
    @notification_types = NotificationType.all
  end

  # GET /notification_types/1
  # GET /notification_types/1.json
  def show
  end

  # GET /notification_types/new
  def new
    @notification_type = NotificationType.new
  end

  # GET /notification_types/1/edit
  def edit
  end

  # POST /notification_types
  # POST /notification_types.json
  def create
    @notification_type = NotificationType.new(notification_type_params)

    respond_to do |format|
      if @notification_type.save
        format.html { redirect_to @notification_type, notice: 'Notification type was successfully created.' }
        format.json { render :show, status: :created, location: @notification_type }
      else
        format.html { render :new }
        format.json { render json: @notification_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_types/1
  # PATCH/PUT /notification_types/1.json
  def update
    respond_to do |format|
      if @notification_type.update(notification_type_params)
        format.html { redirect_to @notification_type, notice: 'Notification type was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification_type }
      else
        format.html { render :edit }
        format.json { render json: @notification_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_types/1
  # DELETE /notification_types/1.json
  def destroy
    @notification_type.destroy
    respond_to do |format|
      format.html { redirect_to notification_types_url, notice: 'Notification type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_type
      @notification_type = NotificationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_type_params
      params.require(:notification_type).permit(:name)
    end
end
