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

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
