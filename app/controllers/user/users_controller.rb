class User::UsersController < ApplicationController
	def my_page

	end


	def daily_meal
		@user = User.find(params[:id])
		@meals = Meal.all
	end

	def daily_meal_balance

	end
end
