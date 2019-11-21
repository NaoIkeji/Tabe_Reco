class User::CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = current_user.comments.new(comment_params)
		@comment.post_id = @post.id
		# @comment.post_target = @post.post_target
		# @comment.post_body = @post.post_body
		if @comment.save
		  redirect_to user_post_path(@post.id)
		else
		   @comments = @post.comments.all.order(created_at: "DESC")
		   render "user/posts/show"
		end
	end


	def edit
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
	end


	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
		   redirect_to user_post_path(@comment.post.id)
		else
			render :edit
		end
	end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to user_post_path(@comment.post.id)
	end


	private
	def comment_params
		params.require(:comment).permit(:comment_body)
	end

end
