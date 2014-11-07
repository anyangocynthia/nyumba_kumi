# == Schema Information
#
# Table name: incidents
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  user_id         :integer
#  notification_id :integer
#  location        :string(255)
#  resolved        :boolean
#  false_flag      :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :incident do
    type ""
    user nil
    notification nil
    location "MyString"
    resolved false
    false_flag false
  end
end
