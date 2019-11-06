class User::MealsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def meal_params
		params.require(:meal).permit()
	end
end
