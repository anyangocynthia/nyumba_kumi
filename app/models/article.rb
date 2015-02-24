class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_attached_file :feature_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :feature_image, :content_type => /\Aimage\/.*\Z/

  def summary
  	self.body.split(".")[0..3].join(" ")
  end

  def author
  	user.name
  end
end
