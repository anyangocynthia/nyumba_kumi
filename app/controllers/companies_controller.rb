class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy, :branches, :nearest_branch, :incidents]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  def incidents
    incidents = []
    current_account.companies.first.incidents.each do |incident|
      inc = {
        :location => incident.location,
        :user_name => incident.user.name,
        :user_phone => incident.user.phone_number,
        :house_name => House.find(incident.user.house_id).house_name,
        :house_number => incident.user.house_number,
        :resolved => incident.resolved ? "YES" : "NO"
      }

      incidents << inc
    end
    render json: incidents
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def branches
    render json: @company.branches
  end

  # def nearest_branch
  #   location = params[:location]
  #   render json: Branch.find_nearest location
  # end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :service_id, :location, :phone_number)
    end
end
