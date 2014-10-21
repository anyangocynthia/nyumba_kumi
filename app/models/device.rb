# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  registration_id :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Device < ActiveRecord::Base
  belongs_to :user
end
