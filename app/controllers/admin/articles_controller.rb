class Admin::ArticlesController < ApplicationController
	before_action :authenticate_admin!

	def index
		@articles = Article.page(params[:page]).reverse_order
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
		   redirect_to admin_articles_path
		else
		   render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
		   redirect_to admin_article_path(@article.id)
		else
			render :edit
		end
	end

	def destroy
		@article = Article.find(params[:id])
		Article.find(params[:id]).destroy
		redirect_to admin_articles_path
	end

	private
	def article_params
		params.require(:article).permit(:article_title, :article_category, :article_image, :article_body)
	end
end
