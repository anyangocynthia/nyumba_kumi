# == Schema Information
#
# Table name: incidents
#
#  id              :integer          not null, primary key
#  incident_type   :string(255)
#  contact_id      :integer
#  notification_id :integer
#  location        :string(255)
#  resolved        :boolean
#  false_flag      :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  company_id      :integer
#  viewed          :boolean          default(FALSE)
#  account_id      :integer
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
