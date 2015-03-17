class RenameHouseToEstate < ActiveRecord::Migration
  def change
  	rename_table :houses, :estates
  end
end
