# == Schema Information
#
# Table name: user_accounts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  account_id   :integer
#  is_preferred :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_account do
    user nil
    account nil
    is_preferred false
  end
end
