# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  user_id    :integer
#  setup      :boolean          default(FALSE)
#  api_token  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    name "MyString"
    user nil
    setup false
    api_token "MyString"
  end
end
