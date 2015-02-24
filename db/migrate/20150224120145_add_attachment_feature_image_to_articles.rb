class AddAttachmentFeatureImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :feature_image
    end
  end

  def self.down
    remove_attachment :articles, :feature_image
  end
end
