json.array!(@articles) do |article|
  json.extract! article, :id, :title, :body, :slug, :category_id
  json.url article_url(article, format: :json)
end
