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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :branch do
    company nil
    phone_number "MyString"
    latitude "MyString"
    longitude "MyString"
  end
end
