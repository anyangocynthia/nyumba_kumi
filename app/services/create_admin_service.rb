class CreateAdminService
  def call
    contact = Contact.find_or_create_by!(email: Rails.application.secrets.admin_email) do |contact|
        contact.password = Rails.application.secrets.admin_password
        contact.password_confirmation = Rails.application.secrets.admin_password
        contact.confirm!
        contact.admin!
      end
  end
end
