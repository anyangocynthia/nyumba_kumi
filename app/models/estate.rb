# == Schema Information
#
# Table name: estates
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

class Estate < ActiveRecord::Base
  belongs_to :contact
  has_many :appartments

  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :location_changed?

  def self.find_nearest lat, long, radius
  	 Estate.near([lat, long], radius, :units => :km)
  end
end
