class RenameContactField < ActiveRecord::Migration
  def change
  	rename_column :contacts, :user_type, :contact_type
  end
end
