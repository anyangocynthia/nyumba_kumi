# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  user_id    :integer
#  setup      :boolean          default(FALSE)
#  api_token  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  belongs_to :user

  has_many :user_accounts
  has_many :users, through: :user_accounts
  has_many :incidents
  has_many :companies
  has_many :branches
end
