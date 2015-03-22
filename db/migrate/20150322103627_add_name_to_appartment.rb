class AddNameToAppartment < ActiveRecord::Migration
  def change
    add_column :appartments, :name, :string
  end
end
