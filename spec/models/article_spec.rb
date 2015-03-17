# == Schema Information
#
# Table name: articles
#
#  id                         :integer          not null, primary key
#  title                      :string(255)
#  body                       :text
#  slug                       :string(255)
#  category_id                :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#  user_id                    :integer
#  published                  :boolean          default(FALSE)
#  feature_image_file_name    :string(255)
#  feature_image_content_type :string(255)
#  feature_image_file_size    :integer
#  feature_image_updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Article, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
