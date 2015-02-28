module Api::V1
	class ContactsController < ApiController
	  before_action :set_contact, only: [:show, :edit, :update, :destroy, :verify]

	  # GET /contacts
	  # GET /contacts.json
	  def index
	    @contacts = Contact.all
	  end

	  # GET /contacts/1
	  # GET /contacts/1.json
	  def show
	    contact = {}
	    contact[:id] = @contact.id
	    contact[:name] = @contact.name
	    contact[:phone_number] = @contact.phone_number
	    contact[:group_id] = @contact.group_id
	    contact[:in_a_group] = !@contact.group_id.nil?
	    contact[:contact_type] = @contact.contact_type
	    contact[:house_name] = (!@contact.house_id.nil?? House.find(@contact.house_id).house_name : nil)
	    contact[:house_number] = @contact.house_number
	    contact[:photo] = "#{ENV['ROOT_URL']}#{@contact.photo.url}"
	    contact[:member_since] = "#{@contact.created_at.strftime("%d/%m/%Y")} #{@contact.created_at.strftime("%I:%M%p")}"

	    render json: contact
	  end

	  # GET /contacts/new
	  def new
	    @contact = Contact.new
	  end

	  # GET /contacts/1/edit
	  def edit
	  end

	  # POST /contacts
	  # POST /contacts.json
	  def create
	    # contact_params[:phone_number] = contact_params[:phone_number].phony_formatted(:normalize => "KE", :format => :international).gsub(/\D/, '')
	    @contact = Contact.new(contact_params)

	    respond_to do |format|
	      if @contact.save
	        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
	        format.json { render json: { id: @contact.id.to_i, status: "success" } }
	      else
	        format.html { render :new }
	        format.json { render json: { id: @contact.id.to_i, status: "failure" } }
	      end
	    end
	  end

	  def verify
	    sms = SMSGateway.new
	    code = params[:verification_code]
	    contact = Contact.find(params[:id])
	    matched = contact.verification_code == code
	    status = ""
	    if contact.verified.nil? || contact.verified == false
	      contact.verified = matched
	      contact.save!
	      if matched
	        status = "Contact verified successfully!"
	        sms.send contact.phone_number, "You have been successfully verified! Thank you."
	      else
	        status = "Wrong verification code! Please try again."
	        # sms.send contact.phone_number, "Sorry! The code you entered didn't match what we had sent you. Please try again."
	      end
	    else
	      status = "Contact has already been verified!"
	    end
	    render json: { id: contact.id, verified: contact.verified, status: status }
	  end

	  # PATCH/PUT /contacts/1
	  # PATCH/PUT /contacts/1.json
	  def update
	      # contact_params[:photo] = File.open(contact_params[:photo])
	      # if contact_params[:phone_number]
	      #   contact_params[:phone_number] = @contact.phone_number
	      # end
	      if params[:photo]
	        @contact.photo = File.open(params[:photo].tempfile)
	        @contact.save!
	      end
	      if params[:contact][:house_name] && contact_params[:house_number]
	        house_id = House.find_or_create_by!(house_name: params[:contact][:house_name]).id
	        @contact.house_id = house_id
	        @contact.house_number = params[:house_number]
	        @contact.save!
	      end
	      if @contact.update(contact_params.except(:phone_number).except(:photo))
	        contact = {}
	        contact[:id] = @contact.id
	        contact[:name] = @contact.name
	        contact[:phone_number] = @contact.phone_number
	        contact[:group_id] = @contact.group_id
	        contact[:contact_type] = @contact.contact_type
	        contact[:member_since] = "#{@contact.created_at.strftime("%d/%m/%Y")} #{@contact.created_at.strftime("%I:%M%p")}"

	        render json: contact
	      else
	        render json: { status: "FAIL"}
	      end
	    end

	  # DELETE /contacts/1
	  # DELETE /contacts/1.json
	  def destroy
	    @contact.destroy
	    respond_to do |format|
	      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
	      format.json { head :no_content }
	    end
	  end

	  private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_contact
	      @contact = Contact.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def contact_params
	      params.require(:contact).permit(:name, :phone_number, :id_number, :group_id, :contact_type, :verified, :verification_code, :house_id, :house_number)
	    end
	end
end