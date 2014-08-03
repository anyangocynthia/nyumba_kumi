# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    phone_number "MyString"
    id_number "MyString"
    group nil
    user_type "MyString"
  end
end
