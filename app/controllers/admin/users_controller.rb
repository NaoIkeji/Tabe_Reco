class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.page(params[:page]).reverse_order
		@search = User.ransack(params[:q])
		@users = @search.result
		# @users = User.where(deleted_at: nil).page(params[:page]).reverse_order
		# @users = User.all
		# @users = User.where(deleted_at: nil).all.order(created_at: "DESC")
	end

	def show
		@user = User.find(params[:id])
	end

	def post_list
		@user = User.find(params[:id])
		@posts = @user.posts.all
	end

	def user_comments
		@user = User.find(params[:id])
		@comments = @user.comments
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to admin_users_path
	end

	def destroy
		@user = User.find(params[:id])
		User.find(params[:id]).destroy
		redirect_to admin_users_path
	end

	def user_search
	end

	def search_list
		@search = User.ransack(params[:q])
		@users = @search.result
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :nickname, :email)
	end
end
