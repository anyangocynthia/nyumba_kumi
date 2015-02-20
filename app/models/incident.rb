# == Schema Information
#
# Table name: incidents
#
#  id              :integer          not null, primary key
#  incident_type   :string(255)
#  contact_id      :integer
#  notification_id :integer
#  location        :string(255)
#  resolved        :boolean
#  false_flag      :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  company_id      :integer
#  viewed          :boolean          default(FALSE)
#

class Incident < ActiveRecord::Base
  belongs_to :contact
  belongs_to :notification
  belongs_to :company
end
