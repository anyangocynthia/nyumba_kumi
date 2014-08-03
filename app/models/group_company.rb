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

class GroupCompany < ActiveRecord::Base
  belongs_to :group
  belongs_to :company
  belongs_to :branch
end
