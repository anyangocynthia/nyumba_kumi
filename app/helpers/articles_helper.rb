module ArticlesHelper
	def pages
		Article.count / 2
	end
end
