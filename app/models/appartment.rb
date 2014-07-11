# == Schema Information
#
# Table name: appartments
#
#  id         :integer          not null, primary key
#  house_id   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Appartment < ActiveRecord::Base
  belongs_to :user
end
