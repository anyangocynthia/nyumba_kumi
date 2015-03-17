class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_attached_file :feature_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :feature_image, :content_type => /\Aimage\/.*\Z/

  scope :page, (lambda do |page_no, per_page|
    where("").in_groups_of(per_page)[page_no.to_i - 1]
  end )

  def summary
  	self.body.split(".")[0..3].join(" ")
  end

  def author
  	user.name if !user.nil?
  end

  def image
  	self.feature_image.url if self.feature_image.url
  end
end
