class Admin::FoodsController < ApplicationController
	def index
		@foods = Food.all
	end

	def new
		@food = Food.new

	end

	def create
		@food = Food.new(food_params)
		@food.save
		redirect_to admin_foods_path
	end

	def edit

	end

	def update

	end

	def destroy

	end


	private
	def food_params
		params.require(:food).permit(:food_item, :food_category, :food_color)
	end

end
