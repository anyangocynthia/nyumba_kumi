class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.references :company, index: true
      t.string :phone_number
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
