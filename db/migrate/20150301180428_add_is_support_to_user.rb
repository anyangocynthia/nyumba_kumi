class AddIsSupportToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_support, :boolean, default: false
  end
end
