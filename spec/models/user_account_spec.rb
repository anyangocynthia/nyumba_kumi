# == Schema Information
#
# Table name: user_accounts
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  account_id   :integer
#  is_preferred :boolean          default(FALSE)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe UserAccount, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
