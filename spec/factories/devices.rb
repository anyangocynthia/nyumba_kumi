# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  contact_id      :integer
#  registration_id :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    user nil
    registration_id "MyString"
  end
end
