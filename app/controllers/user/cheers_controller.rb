class User::CheersController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		cheer = current_user.cheers.new(post_id: post.id)
		cheer.save
		redirect_to user_post_path(post.id)
	end

	def destroy
		post = Post.find(params[:post_id])
		cheer = current_user.cheers.find_by(post_id: post.id)
		cheer.destroy
		redirect_to user_post_path(post.id)
	end
end
