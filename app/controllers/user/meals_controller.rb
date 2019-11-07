class User::MealsController < ApplicationController
	def about
	end

	def index
		@meals = Meal.all
	end

	def show

	end

	def new
		@meal = Meal.new
		@text = "食事を登録する"
		@url = user_meals_path
	end

	def create
		@meal = Meal.new(meal_params)
		@meal.user_id = current_user.id
		if @meal.save!
          redirect_to user_daily_meal_path(current_user.id)
       else
         @text = "食事を登録する"
         @url = user_meals_path
         render :new
       end
	end

	def edit
		@meal = Meal.find(params[:id])
		@text = "食事を編集する"
		@url = user_meals_path
	end

	def update
		@meal = Meal.find(params[:id])
		if @meal.update(meal_params)
			redirect_to user_daily_meal_path(current_user.id)
		else
			render :edit
		end
	end

	def destroy
		@meal = Meal.find(params[:id])
		Meal.find(params[:id]).destroy
		redirect_to user_daily_meal_path(current_user.id)
	end

	private
	def meal_params
		params.require(:meal).permit(:user_id, :ate_date, :ate_time, :meal_item, :meal_image, :meal_text, food_points_attributes: [:id, :meal_id, :food_id, :point, :_destroy])
	end
end
