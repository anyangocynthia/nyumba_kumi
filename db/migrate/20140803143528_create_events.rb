class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :time_of_event
      t.string :venue
      t.text :description

      t.timestamps
    end
  end
end
