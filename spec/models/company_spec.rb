# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  service_id   :integer
#  location     :string(255)
#  phone_number :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

require 'rails_helper'

RSpec.describe Company, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
