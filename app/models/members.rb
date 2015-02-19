# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  contact_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Members < ActiveRecord::Base
  belongs_to :contact
  belongs_to :group
end
