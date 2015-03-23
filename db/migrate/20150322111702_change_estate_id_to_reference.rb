class ChangeEstateIdToReference < ActiveRecord::Migration
  def change
  	remove_column :appartments, :estate_id
  	add_reference :appartments, :estate, index: true
  end
end
