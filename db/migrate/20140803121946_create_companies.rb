class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :service, index: true
      t.string :location
      t.string :phone_number

      t.timestamps
    end
  end
end
