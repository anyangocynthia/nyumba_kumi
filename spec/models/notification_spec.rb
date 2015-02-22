# == Schema Information
#
# Table name: notifications
#
#  id                   :integer          not null, primary key
#  contact_id           :integer
#  group_id             :integer
#  notification_type_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#  message              :string(255)
#

require 'rails_helper'

RSpec.describe Notification, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
