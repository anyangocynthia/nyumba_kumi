class AddAccountToModels < ActiveRecord::Migration
  def change
    add_reference :incidents, :account, index: true
    add_reference :companies, :account, index: true
    add_reference :branches, :account, index: true
  end
end
