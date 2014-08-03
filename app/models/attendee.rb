# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Attendee < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
