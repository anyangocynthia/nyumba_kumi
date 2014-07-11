# == Schema Information
#
# Table name: appartment_residents
#
#  id            :integer          not null, primary key
#  appartment_id :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appartment_resident do
    appartment nil
    user nil
  end
end
