# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  phone_number      :string(255)
#  id_number         :string(255)
#  group_id          :integer
#  user_type         :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  verification_code :string(255)
#  verified          :boolean
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
