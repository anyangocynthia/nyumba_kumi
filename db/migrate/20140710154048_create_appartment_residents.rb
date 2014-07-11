class CreateAppartmentResidents < ActiveRecord::Migration
  def change
    create_table :appartment_residents do |t|
      t.references :appartment, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
