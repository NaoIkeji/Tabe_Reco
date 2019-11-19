class Admin::PostsController < ApplicationController

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
		   redirect_to admin_user_post_list_path(@post.user.id)
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		Post.find(params[:id]).destroy
		redirect_to admin_user_post_list_path(@post.user.id)
	end

	private
	def post_params
		params.require(:post).permit(:post_image, :post_body, :post_target, targets_attributes: [:id, :_destroy])
	end
end
