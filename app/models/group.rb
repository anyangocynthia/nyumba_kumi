# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  group_name :string(255)
#  location   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  belongs_to :user
end
