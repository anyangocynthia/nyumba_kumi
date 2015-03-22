require 'sms_gateway'
module Api::V2
	class ContactsController < ApiController
	  before_action :set_contact, only: [:show, :edit, :update, :destroy, :verify]

	  # GET /contacts
	  # GET /contacts.json
	  def index
	    @contacts = Contact.all
	    render json: @contacts
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
	    contact[:estate_name] = (!@contact.estate_id.nil?? Estate.find(@contact.estate_id).estate_name : nil)
	    contact[:estate_number] = @contact.estate_number
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
	    # @contact = Contact.new(contact_params)

	    # respond_to do |format|
	    #   if @contact.save
	    #     format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
	    #     format.json { render json: { id: @contact.id.to_i, status: "success" } }
	    #   else
	    #     format.html { render :new }
	    #     format.json { render json: { id: @contact.id.to_i, status: "failure" } }
	    #   end
	    # end
	    # contact = Contact.find_or_create_by! email: params[:email], name: params[:name]
	    # if params[:registration_id]
	    # 	Device.find_or_create_by! registration_id: params[:registration_id], contact_id: contact.id
	    # end
	    # if params[:photo]
	    #   contact.photo = File.open(params[:photo].tempfile)
	    #   contact.save!
	    # end
	    gateway = SMSGateway.new
	    phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(params[:phone_number]), country_number: "254"
	    contact = Contact.find_or_create_by! phone_number: phone_number
	    contact.update(email: params[:email], name: params[:name])
	    if params[:photo]
	      contact.photo = File.open(params[:photo].tempfile)
	      contact.save!
	    end

	    if contact.group.nil?
	    	contact.update(group: Group.create!(group_name: "Group##{Group.count + 1}", contact: contact))
	    end
	    if contact.verified != true
			if contact.verification_code.nil?
				send_verification_code contact
			else
				gateway.send(contact.phone_number, "We had already sent you the verification code. Here it is again: #{contact.verification_code}.")
			end
		end
		render json: { id: contact.id.to_i, status: "success" }
	  end

	  # def save_number
	  # 	# {id: 1, phone_number: "254722123456"}
	  # 	gateway = SMSGateway.new
	  # 	contact = Contact.find(params[:id])
	  # 	phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(params[:phone_number]), country_number: "254"
	  # 	if contact.phone_number.nil?
	  # 		contact.update(phone_number: phone_number)
	  # 	elsif contact.phone_number == phone_number
	  # 		# send verification code
	  # 		if verified == false
			# 	if contact.verification_code.nil?
			# 		send_verification_code contact
			# 	else
			# 		gateway.send(contact.phone_number, "We had already sent you the verification code. Here it is again: #{contact.verification_code}.")
			# 	end
			# end
	  # 	else
	  # 		render json: {error: "Check the phone number and try again"}
	  # 	end
	  # end

	  def invite_contacts
	  	# contacts = [{name: "John Doe", phone_number: "254722772838"}, {name: "Jane Doe", phone_number: "254722772832"}]
	  	# params = {"inviter" => contact_id, contacts => contacts}
	  	gateway = SMSGateway.new
	  	group = Contact.find(params[:inviter]).group
	  	inviter = Contact.find(params[:inviter]).name
	  	contacts = params[:contacts]
	  	in_a_group = []
	  	not_in_a_group = []
	  	contacts.each do |u|
	  		name = u[:name]
	  		phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(u[:phone_number]), country_number: "254"
	  		contact = Contact.find_or_create_by! phone_number: phone_number, name: name
	  		is_in_a_group = !contact.group_id.nil?
	  		if is_in_a_group
	  			in_a_group << phone_number
	  		else
	  			contact.group = group
	  			contact.contact_type = "Member"
	  			contact.save!

	  			gateway.send contact.phone_number, "Hi. You have been invited to Ujirani app by #{inviter}. Please click http://goo.gl/XeBk2c to download the app."
	  			not_in_a_group << phone_number
	  		end
	  	end
	  	render json: { in_a_group: in_a_group, not_in_a_group: not_in_a_group }
	  end

	  def save_house_details
	  	# {estate_id: 1, contact_id: 1, appartment_name: "43A"}
	  	appartment = Appartment.create! estate_id: params[:estate_id], contact_id: params[:contact_id]
	  	render json: {contact_id: params[:contact_id], estate_id: params[:estate_id], appartment_id: appartment.id}
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
	      if params[:contact][:estate_name] && contact_params[:estate_number]
	        estate_id = Estate.find_or_create_by!(estate_name: params[:contact][:estate_name]).id
	        @contact.estate_id = estate_id
	        @contact.estate_number = params[:estate_number]
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
	      params.require(:contact).permit(:name, :phone_number, :id_number, :group_id, :contact_type, :verified, :verification_code, :estate_id, :estate_number)
	    end
	end
end