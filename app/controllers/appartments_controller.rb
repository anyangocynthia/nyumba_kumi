class AppartmentsController < ApplicationController
  before_action :set_appartment, only: [:show, :edit, :update, :destroy]

  # GET /appartments
  # GET /appartments.json
  def index
    @appartments = Appartment.all
  end

  # GET /appartments/1
  # GET /appartments/1.json
  def show
  end

  # GET /appartments/new
  def new
    @appartment = Appartment.new
  end

  # GET /appartments/1/edit
  def edit
  end

  # POST /appartments
  # POST /appartments.json
  def create
    @appartment = Appartment.new(appartment_params)

    respond_to do |format|
      if @appartment.save
        format.html { redirect_to @appartment, notice: 'Appartment was successfully created.' }
        format.json { render :show, status: :created, location: @appartment }
      else
        format.html { render :new }
        format.json { render json: @appartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appartments/1
  # PATCH/PUT /appartments/1.json
  def update
    respond_to do |format|
      if @appartment.update(appartment_params)
        format.html { redirect_to @appartment, notice: 'Appartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appartment }
      else
        format.html { render :edit }
        format.json { render json: @appartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appartments/1
  # DELETE /appartments/1.json
  def destroy
    @appartment.destroy
    respond_to do |format|
      format.html { redirect_to appartments_url, notice: 'Appartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appartment
      @appartment = Appartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appartment_params
      params.require(:appartment).permit(:house_id, :contact_id)
    end
end
