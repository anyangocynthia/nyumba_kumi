class AddCompanyToIncidents < ActiveRecord::Migration
  def change
    add_reference :incidents, :company, index: true
  end
end
