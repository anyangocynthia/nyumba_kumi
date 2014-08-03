# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  time_of_event :datetime
#  venue         :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    time_of_event "2014-08-03 17:35:29"
    venue "MyString"
    description "MyText"
  end
end
