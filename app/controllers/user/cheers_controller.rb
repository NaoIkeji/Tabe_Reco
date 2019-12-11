class User::CheersController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		cheer = current_user.cheers.build(post_id: params[:post_id])
		cheer.save
		# cheer = current_user.cheers.new(post_id: post.id)
		# redirect_to user_post_path(post.id)
	end

	def destroy
		@post = Post.find(params[:post_id])
		cheer = Cheer.find_by(post_id: params[:post_id], user_id: current_user.id)
		cheer.destroy
		# cheer = current_user.cheers.find_by(post_id: post.id)
		# redirect_to user_post_path(post.id)
	end

end
