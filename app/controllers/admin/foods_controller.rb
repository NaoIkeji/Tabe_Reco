class Admin::FoodsController < ApplicationController
	before_action :authenticate_admin!

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
		@food = Food.find(params[:id])
	end

	def update
		@food = Food.find(params[:id])
		if @food.update(food_params)
		   redirect_to admin_foods_path
		else
			render :edit
		end
	end


	def destroy
		@food = Food.find(params[:id])
		Food.find(params[:id]).destroy
		redirect_to admin_foods_path
	end


	private
	def food_params
		params.require(:food).permit(:food_item, :food_category, :food_color)
	end

end
