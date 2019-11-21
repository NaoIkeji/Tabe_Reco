class User::ArticlesController < ApplicationController
	def index
		@articles = Article.page(params[:page]).reverse_order
		@genres = ArticleGenre.all
	end

	def show
		@article = Article.find(params[:id])
	end
end
