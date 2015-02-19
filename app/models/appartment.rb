# == Schema Information
#
# Table name: appartments
#
#  id         :integer          not null, primary key
#  house_id   :string(255)
#  contact_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Appartment < ActiveRecord::Base
  belongs_to :contact
  belongs_to :house

  has_many :appartment_residents
  has_many :contacts, through: :appartment_residents
end
