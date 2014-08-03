# == Schema Information
#
# Table name: appartments
#
#  id         :integer          not null, primary key
#  house_id   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Appartment < ActiveRecord::Base
  belongs_to :user
  belongs_to :house

  has_many :appartment_residents
  has_many :users, through: :appartment_residents
end
