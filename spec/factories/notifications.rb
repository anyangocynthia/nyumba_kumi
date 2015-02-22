# == Schema Information
#
# Table name: notifications
#
#  id                   :integer          not null, primary key
#  contact_id           :integer
#  group_id             :integer
#  notification_type_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#  message              :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user nil
    group nil
    notification_type nil
  end
end
