class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :house_name
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
