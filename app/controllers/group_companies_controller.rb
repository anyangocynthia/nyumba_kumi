class GroupCompaniesController < ApplicationController
  before_action :set_group_company, only: [:show, :edit, :update, :destroy]

  # GET /group_companies
  # GET /group_companies.json
  def index
    @group_companies = GroupCompany.all
  end

  # GET /group_companies/1
  # GET /group_companies/1.json
  def show
  end

  # GET /group_companies/new
  def new
    @group_company = GroupCompany.new
  end

  # GET /group_companies/1/edit
  def edit
  end

  # POST /group_companies
  # POST /group_companies.json
  def create
    @group_company = GroupCompany.new(group_company_params)

    respond_to do |format|
      if @group_company.save
        format.html { redirect_to @group_company, notice: 'Group company was successfully created.' }
        format.json { render :show, status: :created, location: @group_company }
      else
        format.html { render :new }
        format.json { render json: @group_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_companies/1
  # PATCH/PUT /group_companies/1.json
  def update
    respond_to do |format|
      if @group_company.update(group_company_params)
        format.html { redirect_to @group_company, notice: 'Group company was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_company }
      else
        format.html { render :edit }
        format.json { render json: @group_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_companies/1
  # DELETE /group_companies/1.json
  def destroy
    @group_company.destroy
    respond_to do |format|
      format.html { redirect_to group_companies_url, notice: 'Group company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_company
      @group_company = GroupCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_company_params
      params.require(:group_company).permit(:group_id, :company_id, :company_type, :branch_id)
    end
end
