class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :members, :group_services, :notifications]
  # respond_to :json

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    render json: @groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    grp = Group.find_by(group_name: group_params[:group_name])
    if grp.nil?
      user = User.find(group_params[:user_id])
      if user.group_id.nil?
        @group = Group.new(group_params)
        respond_to do |format|
          if @group.save
            user.update(group_id: @group.id, user_type: "Admin")
            format.html { redirect_to @group, notice: 'Group was successfully created.' }
            format.json { render json: { id: @group.id.to_i, status: "success" } }
          else
            format.html { render :new }
            format.json { render json: { id: @group.id.to_i, status: "failure" } }
          end
        end
      else
        render json: { error: "You already belong to #{user.group.group_name}." }
      end
    else
      render json: { id: grp.id.to_i, status: "Group already exists!" }
    end
  end

  def notifications
    notifications = []
    notification = {}
    @group.notifications.each do |n|
      notification[:user_id] = n.user_id
      notification[:group_id] = n.group_id
      notification[:message] = n.message
      notification[:time] = "#{n.created_at.strftime("%d/%m/%Y")} #{n.created_at.strftime("%I:%M%p")}"
      notifications << notification
    end
    render json: notifications
  end

  def members
    members = []
    @group.users.each do |u|
      user = {}
      user[:id] = u.id
      user[:name] = u.name
      user[:phone_number] = u.phone_number
      user[:group_id] = u.group_id
      user[:in_a_group] = !u.group_id.nil?
      user[:user_type] = u.user_type
      user[:house_name] = (!u.house_id.nil?? House.find(u.house_id).house_name : nil)
      user[:house_number] = u.house_number
      user[:photo] = "#{ENV['ROOT_URL']}#{u.photo.url}"
      user[:member_since] = "#{u.created_at.strftime("%d/%m/%Y")} #{u.created_at.strftime("%I:%M%p")}"
      members << user
    end
    render json: members
  end

  def group_services
    services = {}
    @group.companies.each do |company|
      services[company.service.name] = company.name
    end
    render json: services
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render json: { id: @group.id.to_i, status: "success" } }
      else
        format.html { render :edit }
        format.json { render json: { id: @group.id.to_i, status: "failure" } }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:group_name, :location, :user_id)
    end
end
