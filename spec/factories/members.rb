# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :member, :class => 'Members' do
    user nil
    group nil
  end
end
