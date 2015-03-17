class ChangeFieldsForAppartments < ActiveRecord::Migration
  def change
  	rename_column :appartments, :house_id, :estate_id
  end
end
