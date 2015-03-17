# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  user_id    :integer
#  setup      :boolean          default(FALSE)
#  api_token  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Account, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
