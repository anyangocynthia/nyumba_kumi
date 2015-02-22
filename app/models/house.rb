# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  house_name :string(255)
#  location   :string(255)
#  contact_id :integer
#  created_at :datetime
#  updated_at :datetime
#  latitude   :float
#  longitude  :float
#

class House < ActiveRecord::Base
  belongs_to :contact
  has_many :appartments
  # reverse_geocoded_by :latitude, :longitude

  # def self.find_nearest location
  # 	house = House.near([location.latitude, location.longitude], 20, :units => :km).first
  # 	return house
  # end
end
