class Admin::FoodsController < ApplicationController
	def index
	end

	def new
		@food = Food.new

	end

	def create
		@food = Food.new(food_params)
		@food.save
		redirect_to
	end

	def edit

	end

	def update

	end

	def destroy

	end


	private
	def food_params
		params.require(:food).permit(:ate_date, :ate_time, :meal_item, :meal_image_id, :meal_text)
	end

end
