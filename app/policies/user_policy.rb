class ContactPolicy
  attr_reader :current_contact, :model

  def initialize(current_contact, model)
    @current_contact = current_contact
    @contact = model
  end

  def index?
    @current_contact.admin?
  end

  def show?
    @current_contact.admin? or @current_contact == @contact
  end

  def update?
    @current_contact.admin?
  end

  def destroy?
    return false if @current_contact == @contact
    @current_contact.admin?
  end

end
