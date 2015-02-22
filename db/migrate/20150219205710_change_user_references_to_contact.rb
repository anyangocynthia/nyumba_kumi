class ChangeUserReferencesToContact < ActiveRecord::Migration
  def change
  	rename_column :appartment_residents, :user_id, :contact_id
  	rename_column :appartments, :user_id, :contact_id
  	rename_column :attendees, :user_id, :contact_id
  	rename_column :devices, :user_id, :contact_id
  	rename_column :groups, :user_id, :contact_id
  	rename_column :houses, :user_id, :contact_id
  	rename_column :incidents, :user_id, :contact_id
  	rename_column :members, :user_id, :contact_id
  	rename_column :notifications, :user_id, :contact_id
  end
end
