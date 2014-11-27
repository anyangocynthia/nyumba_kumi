class AddViewedToIncident < ActiveRecord::Migration
  def change
    add_column :incidents, :viewed, :boolean, default: false
  end
end
