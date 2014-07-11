# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  house_name :string(255)
#  location   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class House < ActiveRecord::Base
  belongs_to :user
end
