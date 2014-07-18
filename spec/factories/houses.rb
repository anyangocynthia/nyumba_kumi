# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  house_name :string(255)
#  location   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    house_name "MyString"
    location "MyString"
    user nil
  end
end