class Admin::ArticleGenresController < ApplicationController
	def index
		@genres = ArticleGenre.all
	end

	def new
		@genre = ArticleGenre.new
	end

	def create
		genre = ArticleGenre.new(genre_params)
		if genre.save
			redirect_to new_admin_article_path
		else
			render :new
		end
	end

	def edit
		@genre = ArticleGenre.find(params[:id])
	end

	def update
		genre = ArticleGenre.find(params[:id])
		if genre.update(genre_params)
		   redirect_to admin_article_genres_path
		else
			render :edit
		end
	end

	def destroy
		genre = ArticleGenre.find(params[:id])
		ArticleGenre.find(params[:id]).destroy
		redirect_to admin_article_genres_path
	end

	private
	def genre_params
		params.require(:article_genre).permit(:genre_name)
	end
end
