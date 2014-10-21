require "gcm_notifications"
class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy, :index]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.where(group_id: params[:group_id])
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    gcm = GCMNotifications.new
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        registration_ids = @notification.group.users.collect {|user| user.devices.collect {|device| device.registration_id}}
        data = {message: @notification.message}
        gcm.send registration_ids, data, "New notification"
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render json: { id: @notification.id.to_i, status: "success" } }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.where(id: params[:id], group_id: params[:group_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:user_id, :group_id, :notification_type_id, :message)
    end
end
