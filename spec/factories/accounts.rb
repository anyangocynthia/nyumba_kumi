# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    name "MyString"
    user nil
    setup false
    api_token "MyString"
  end
end
