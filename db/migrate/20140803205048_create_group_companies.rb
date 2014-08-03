class CreateGroupCompanies < ActiveRecord::Migration
  def change
    create_table :group_companies do |t|
      t.references :group, index: true
      t.references :company, index: true
      t.string :company_type
      t.references :branch, index: true

      t.timestamps
    end
  end
end
