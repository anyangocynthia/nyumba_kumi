# == Schema Information
#
# Table name: notification_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe NotificationType, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
