class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  def summary
  	self.body.split(".")[0..3].join(" ")
  end

  def author
  	user.name
  end
end
