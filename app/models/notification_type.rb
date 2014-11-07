# == Schema Information
#
# Table name: notification_types
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  alert_message :string(255)
#

class NotificationType < ActiveRecord::Base
	has_many :notifications
end
