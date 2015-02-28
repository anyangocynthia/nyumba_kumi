class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :name
      t.references :user, index: true
      t.boolean :setup, default: false
      t.string :api_token

      t.timestamps
    end
  end
end
