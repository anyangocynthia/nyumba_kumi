class AddHouseNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :house_number, :string
  end
end
