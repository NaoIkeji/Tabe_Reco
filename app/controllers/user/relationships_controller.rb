class User::RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:followed_id])
	  	relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
	  	relationship.save
	  	# redirect_to user_users_path
    end

    def destroy
    	@user = Relationship.find(params[:id]).followed
	  	relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
	  	relationship.destroy
	  	# redirect_to user_users_path
    end

	# def follow
	# 	current_user.follow(params[:id])
	# 	redirect_to user_users_path
	# end

	# def unfollow
	# 	current_user.unfollow(params[:id])
	# 	redirect_to user_users_path
	# end

	# def create
		# @user = User.find(params[:followed_id])
		# current_user.follow(@user)
		# respond_to do |format|
		# 	format.html{redirect_to @user}
		# 	format.js
		# end

		# relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
		# relationship.save
		# redirect_to user_users_path
	# end

	# def destroy
		# @user = Relationship.find(params[:id]).followed
		# current_user.unfollow(@user)
		# respond_to do |format|
		# 	format.html{redirect_to @user}
		# 	format.js
		# end

		# relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
		# relationship.destroy
		# redirect_to user_users_path
	# end
end
