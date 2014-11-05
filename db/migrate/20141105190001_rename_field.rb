class RenameField < ActiveRecord::Migration
  def change
  	rename_column :incidents, :type, :incident_type
  end
end
