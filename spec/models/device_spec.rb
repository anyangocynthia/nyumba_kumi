# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  contact_id      :integer
#  registration_id :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe Device, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
