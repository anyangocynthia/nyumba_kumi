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
#

class Company < ActiveRecord::Base
  belongs_to :service
  has_many :branches

  has_many :group_companies
  has_many :groups, through: :group_companies
end
