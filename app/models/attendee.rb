# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  contact_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Attendee < ActiveRecord::Base
  belongs_to :event
  belongs_to :contact
end
