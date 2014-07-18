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
#  latitude   :float
#  longitude  :float
#

require 'rails_helper'

RSpec.describe House, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
