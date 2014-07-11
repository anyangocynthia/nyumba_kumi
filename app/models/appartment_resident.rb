# == Schema Information
#
# Table name: appartment_residents
#
#  id            :integer          not null, primary key
#  appartment_id :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class AppartmentResident < ActiveRecord::Base
  belongs_to :appartment
  belongs_to :user
end
