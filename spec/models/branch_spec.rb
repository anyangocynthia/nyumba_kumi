# == Schema Information
#
# Table name: branches
#
#  id           :integer          not null, primary key
#  company_id   :integer
#  phone_number :string(255)
#  latitude     :string(255)
#  longitude    :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  account_id   :integer
#

require 'rails_helper'

RSpec.describe Branch, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
