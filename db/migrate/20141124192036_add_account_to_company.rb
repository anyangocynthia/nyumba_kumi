class AddAccountToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :account, index: true
  end
end
