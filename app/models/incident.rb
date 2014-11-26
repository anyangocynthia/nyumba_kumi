# == Schema Information
#
# Table name: incidents
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  user_id         :integer
#  notification_id :integer
#  location        :string(255)
#  resolved        :boolean
#  false_flag      :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class Incident < ActiveRecord::Base
  belongs_to :user
  belongs_to :notification
  belongs_to :company
end
