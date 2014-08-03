# == Schema Information
#
# Table name: branches
#
#  id           :integer          not null, primary key
#  company_id   :integer
#  phone_number :string(255)
#  latitude     :string(255)
#  longitude    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Branch < ActiveRecord::Base
  belongs_to :company

  has_many :group_companies
  has_many :groups, through: :group_companies

  reverse_geocoded_by :latitude, :longitude

  def self.find_nearest location
  	branch = Branch.near([location[:latitude], location[:longitude]], 20, :units => :km).first
  	return branch
  end
end
