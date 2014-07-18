class AddFieldsToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :latitude, :float
    add_column :houses, :longitude, :float
  end
end
