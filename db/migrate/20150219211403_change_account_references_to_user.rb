class ChangeAccountReferencesToUser < ActiveRecord::Migration
  def change
  	rename_column :companies, :account_id, :user_id
  end
end
