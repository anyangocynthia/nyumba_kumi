# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  service_id   :integer
#  location     :string(255)
#  phone_number :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  account_id   :integer
#

class Company < ActiveRecord::Base
	belongs_to :account
  acts_as_tenant(:account)
  belongs_to :service
  belongs_to :user
  has_many :branches
  has_many :incidents

  has_many :group_companies
  has_many :groups, through: :group_companies
end
