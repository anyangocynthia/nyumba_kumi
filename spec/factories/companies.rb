# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  service_id   :integer
#  location     :string(255)
#  phone_number :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  account_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "MyString"
    service nil
    location "MyString"
    phone_number "MyString"
  end
end
