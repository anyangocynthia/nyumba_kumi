class CreateUsers < ActiveRecord::Migration
  def change
    # drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :id_number
      t.references :group, index: true
      t.string :user_type

      t.timestamps
    end
  end
end
