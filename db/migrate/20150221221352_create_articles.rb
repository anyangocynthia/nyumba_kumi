class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.references :category, index: true

      t.timestamps
    end
  end
end
