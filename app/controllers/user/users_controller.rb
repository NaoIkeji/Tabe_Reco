class User::UsersController < ApplicationController
	def my_page
		@meal = Meal.select(:ate_date).order(ate_date: "ASC").distinct
	end

	def daily_meal
		@user = User.find(params[:id])
		@date = params[:commit]
		@meals = Meal.where(user_id: current_user.id, ate_date: @date).order(ate_time: "ASC")
	end

	def daily_meal_balance
		@user = User.find(params[:id])
		@date = params[:commit]
		@meals = Meal.where(user_id: current_user.id, ate_date: @date).order(ate_time: "ASC")
		@meals.each do |meal|
			@yellow_food_points = 0
			@red_food_points = 0
			@green_food_points = 0
			meal.food_points.each do |food_point|
				if food_point.food.food_color == "黄色"
						@yellow_food_points += food_point.point
				elsif food_point.food.food_color == "赤色"
					   @red_food_points += food_point.point
				elsif food_point.food.food_color == "緑色"
					   @green_food_points += food_point.point
				end
			end
		end
		binding.pry
	end

	def my_data

	end

	def setting_changing
	end

end
