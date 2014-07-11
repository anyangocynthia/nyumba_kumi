class CreateAppartments < ActiveRecord::Migration
  def change
    create_table :appartments do |t|
      t.string :house_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
