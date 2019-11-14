class User::UsersController < ApplicationController
	before_action :authenticate_user!

	def my_page
		@meals = Meal.select(:ate_date).order(ate_date: "ASC").distinct
		list=[]
		@meals.each do |meal|
		@aaa=current_user.id.to_s
		urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")

		# url = "/daily_meal?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
	    # puts "-----------------------------------------"
	    # puts meal.ate_date.strftime("%F")
	    # puts urln

	    #listという変数に{'title' => '登録済み','start' => meal.ate_date.strftime("%F"), 'url' => urln }
	    #をaddしていく処理
	    obj = {title: '登録済み', start: meal.ate_date.strftime("%F"), url: urln }
	    list.push(obj)
	    # gon.json = [{'title' => '登録済み','start' => 'meal.ate_date', 'url'
	    #gon.json = [{'title' => '登録済み','start' => meal.ate_date.strftime("%F"), 'url' => urln }]
	    end
	    gon.json = list

		# @meal.variations.each do |variation|
		# 	json.set! variation.product_code, variation
		# end

		# list = []
		# gon.json = list

		# gon.json = [{'title' => 'TEST','start' => '2019-11-13T07:00:00',},
		# 	{'title' => 'TEST2','start' => '2019-11-14T07:00:00'}]
		# gon.json = [{'title' => '登録済み', 'start' => '2019-11-12'}]
		# {'start' => '2019-11-10', 'title' => url},]
		# gon.json = [{'title' => '登録済み', 'start' => '@meal.ate_date'}]
		# gon.json = [{'title' => '登録済み', 'start' => '@meal.ate_date', 'url' => '{"user/users" + "current_user.id" + "/daily_meal?utf8=%E2%9C%93&commit=" + "meal.ate_date.strtime("%y%-%m%-%d%")"}'}]
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
		@yellow_food_points = 0
		@red_food_points = 0
		@green_food_points = 0
		@meals.each do |meal|
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
		gon.yellow_food_points = @yellow_food_points
		gon.red_food_points = @red_food_points
		gon.green_food_points = @green_food_points
	end


	def my_data
	end


	def setting_changing
	end

	def new

	end

	def create

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_setting_changing_path(current_user.id)
	end

	private

	def user_params
		params.require(:user).permit(:nickname, :profile_image, :introduction, targets_attributes:[:id, :target_body, :_destroy])
	end


end
