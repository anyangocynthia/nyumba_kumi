# == Schema Information
#
# Table name: notifications
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  group_id             :integer
#  notification_type_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#  message              :string(255)
#

class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  belongs_to :notification_type
end
