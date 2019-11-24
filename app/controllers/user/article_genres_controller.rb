class User::ArticleGenresController < ApplicationController
	before_action :authenticate_user!

	def show
		@article_genre = ArticleGenre.find(params[:id])
		@articles = @article_genre.articles
		# @articles = Article.page(params[:page]).reverse_order
		@genres = ArticleGenre.all
	end
end
