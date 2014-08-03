# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  time_of_event :datetime
#  venue         :string(255)
#  description   :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Event < ActiveRecord::Base
	has_many :attendees
	has_many :users, through: :attendees
end
