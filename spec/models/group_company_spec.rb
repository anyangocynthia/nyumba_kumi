# == Schema Information
#
# Table name: group_companies
#
#  id           :integer          not null, primary key
#  group_id     :integer
#  company_id   :integer
#  company_type :string(255)
#  branch_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe GroupCompany, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
