class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :type
      t.references :user, index: true
      t.references :notification, index: true
      t.string :location
      t.boolean :resolved
      t.boolean :false_flag

      t.timestamps
    end
  end
end
