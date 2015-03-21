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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appartment do
    house_id "MyString"
    user nil
  end
end
