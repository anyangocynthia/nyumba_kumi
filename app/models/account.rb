class Account < ActiveRecord::Base
  belongs_to :user

  has_many :user_accounts
  has_many :users, through: :user_accounts
  has_many :incidents
  has_many :companies
  has_many :branches
end
