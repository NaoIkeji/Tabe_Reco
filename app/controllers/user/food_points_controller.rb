class User::FoodPointsController < ApplicationController
	before_action :authenticate_user!
end
