class RenameHouseToEstateForContacts < ActiveRecord::Migration
  def change
  	rename_column :contacts, :house_id, :estate_id
  end
end
