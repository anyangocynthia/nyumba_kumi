class AppartmentResidentsController < ApplicationController
  before_action :set_appartment_resident, only: [:show, :edit, :update, :destroy]

  # GET /appartment_residents
  # GET /appartment_residents.json
  def index
    @appartment_residents = AppartmentResident.all
  end

  # GET /appartment_residents/1
  # GET /appartment_residents/1.json
  def show
  end

  # GET /appartment_residents/new
  def new
    @appartment_resident = AppartmentResident.new
  end

  # GET /appartment_residents/1/edit
  def edit
  end

  # POST /appartment_residents
  # POST /appartment_residents.json
  def create
    @appartment_resident = AppartmentResident.new(appartment_resident_params)

    respond_to do |format|
      if @appartment_resident.save
        format.html { redirect_to @appartment_resident, notice: 'Appartment resident was successfully created.' }
        format.json { render :show, status: :created, location: @appartment_resident }
      else
        format.html { render :new }
        format.json { render json: @appartment_resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appartment_residents/1
  # PATCH/PUT /appartment_residents/1.json
  def update
    respond_to do |format|
      if @appartment_resident.update(appartment_resident_params)
        format.html { redirect_to @appartment_resident, notice: 'Appartment resident was successfully updated.' }
        format.json { render :show, status: :ok, location: @appartment_resident }
      else
        format.html { render :edit }
        format.json { render json: @appartment_resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appartment_residents/1
  # DELETE /appartment_residents/1.json
  def destroy
    @appartment_resident.destroy
    respond_to do |format|
      format.html { redirect_to appartment_residents_url, notice: 'Appartment resident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appartment_resident
      @appartment_resident = AppartmentResident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appartment_resident_params
      params.require(:appartment_resident).permit(:appartment_id, :contact_id)
    end
end
