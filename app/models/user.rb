# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  phone_number       :string(255)
#  id_number          :string(255)
#  group_id           :integer
#  user_type          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  verification_code  :string(255)
#  verified           :boolean
#  house_id           :integer
#  house_number       :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class User < ActiveRecord::Base
	after_create :normalize_number
  belongs_to :group
  has_many :notifications
  has_many :devices

  has_attached_file :photo#, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def normalize_number
		self.phone_number = PhonyRails.normalize_number PhonyRails.normalize_number(self.phone_number), country_number: "254"
		self.save!
  end
end
