# == Schema Information
#
# Table name: appartments
#
#  id         :integer          not null, primary key
#  house_id   :string(255)
#  user_id    :integer
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
