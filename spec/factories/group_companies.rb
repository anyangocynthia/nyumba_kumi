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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_company do
    group nil
    company nil
    company_type "MyString"
    branch nil
  end
end
