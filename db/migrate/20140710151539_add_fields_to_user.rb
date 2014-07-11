class AddFieldsToUser < ActiveRecord::Migration
  def change
    # add_column :users, :name, :string
    add_column :users, :id_number, :string
    add_column :users, :phone_number, :string
  end
end
