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
#  latitude   :float
#  longitude  :float
#

class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members
  has_many :users, through: :members
  reverse_geocoded_by :latitude, :longitude

  def self.find_nearest location
  	group = Group.near([location.latitude, location.longitude], 20, :units => :km).first
  	return group
  end
end
