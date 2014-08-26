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
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: { id: @group.id.to_i, status: "success" } }
      else
        format.html { render :new }
        format.json { render json: { id: @group.id.to_i, status: "failure" } }
      end
    end
  end

  def notifications
    render json: @group.notifications
  end

  def members
    render json: @group.users
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
