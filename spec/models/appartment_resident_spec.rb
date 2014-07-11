# == Schema Information
#
# Table name: appartment_residents
#
#  id            :integer          not null, primary key
#  appartment_id :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe AppartmentResident, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
