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

require 'rails_helper'

RSpec.describe Incident, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
