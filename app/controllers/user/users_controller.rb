class User::UsersController < ApplicationController
	def my_page
		@meal = Meal.select(:ate_date).order(ate_date: "ASC").distinct
	end

	def daily_meal
		@user = User.find(params[:id])
		@date = params[:commit]
		@meals = Meal.where(user_id: current_user.id,ate_date: @date)
	end

	def daily_meal_balance
		@user = User.find(params[:id])
		@date = params[:commit]
		@meals = Meal.where(user_id: current_user.id,ate_date: @date)

	end

	def my_data

	end

	def setting_changing
	end

end
