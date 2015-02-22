# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Members, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
