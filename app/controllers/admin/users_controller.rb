class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.page(params[:page]).reverse_order
		# 検索オブジェクトの作成 params[:q]には検索パラメータが渡される
		@search = User.ransack(params[:q])
		# 検索結果を得る
		@users = @search.result
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

	def search_list
		@search = User.ransack(params[:q])
		@users = @search.result
	end

	private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :nickname, :email)
	end
end
