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

require 'rails_helper'

RSpec.describe Incident, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end