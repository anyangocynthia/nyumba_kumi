# == Schema Information
#
# Table name: appartments
#
#  id         :integer          not null, primary key
#  estate_id  :string(255)
#  contact_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Appartment, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
