class User::FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post_id: params[:post_id])
		favorite.save
		# 同期
		# favorite = current_user.favorites.new(post_id: post.id)
		# redirect_to user_post_path(post.id)
	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
		favorite.destroy
		# favorite = current_user.favorites.find_by(post_id: post.id)
		# redirect_to user_post_path(post.id)
	end
end
