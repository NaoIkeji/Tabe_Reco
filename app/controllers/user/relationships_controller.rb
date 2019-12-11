class User::RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:user_id])
	  	relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:user_id])
	  	relationship.save
	  	# redirect_to user_users_path
    end

    def destroy
    	@user = User.find(params[:user_id])
	  	relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
	  	relationship.destroy
	  	# redirect_to user_users_path
    end

end
