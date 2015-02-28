# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_account do
    user nil
    account nil
    is_preferred false
  end
end
