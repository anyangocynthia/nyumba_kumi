# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    time_of_event "2014-08-03 17:35:29"
    venue "MyString"
    description "MyText"
  end
end
