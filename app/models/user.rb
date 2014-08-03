class User < ActiveRecord::Base
  belongs_to :group
  # has_one :member
  # has_one :group, through: :member
end
