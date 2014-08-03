# == Schema Information
#
# Table name: notification_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class NotificationType < ActiveRecord::Base
	has_many :notifications
end
