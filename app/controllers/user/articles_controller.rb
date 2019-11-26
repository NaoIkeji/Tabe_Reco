class User::ArticlesController < ApplicationController
	before_action :authenticate_user!

	def index
		@articles = Article.page(params[:page]).reverse_order
		@genres = ArticleGenre.all
	end

	def show
		@article = Article.find(params[:id])
		@genres = ArticleGenre.all
	end
end
