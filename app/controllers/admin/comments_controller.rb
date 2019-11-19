class Admin::CommentsController < ApplicationController
	before_action :authenticate_admin!

	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to admin_user_comments_path(@comment.user.id)
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to admin_user_comments_path(@comment.user.id)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment_body)
	end
end
