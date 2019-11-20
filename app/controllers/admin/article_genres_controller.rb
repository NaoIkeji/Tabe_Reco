class Admin::ArticleGenresController < ApplicationController
	def index
		@genre = ArticleGenres.all
	end

	def new
		@genre = ArticleGenres.new
	end

	def create
		genre = ArticleGenre.new(genre_params)
		if genre.save
			redirect_to 
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
			# redirect_to
		else
			render :edit
		end
	end

	def destroy
		genre = ArticleGenre.find(params[:id])
		ArticleGenre.find(params[:id]).destroy
		# redirect_to 
	end

	private
	def genre_params
		params.require(:meal).permit(:genre_name)
	end
end
