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

class UserAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
end
