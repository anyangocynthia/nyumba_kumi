# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  group_name :string(255)
#  location   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Group, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
