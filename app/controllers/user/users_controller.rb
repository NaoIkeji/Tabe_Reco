class User::UsersController < ApplicationController
	before_action :authenticate_user!

	def my_page
		#ログインユーザーの食事情報を取得するように書き換える
		@meals = Meal.select(:ate_date).where(user_id: current_user.id).distinct#全食事情報を取得している
		@targets = Target.where(user_id: current_user.id)
	end

	def json
		@meals = Meal.select(:ate_date).where(user_id: current_user.id).distinct
		meal_json=[]
		@meals.each do |meal|
		# urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
	    #listという変数に{'title' => '登録済み','start' => meal.ate_date.strftime("%F"), 'url' => urln }
	    #をaddしていく処理
			urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
	   		obj = {title: '登録済み', start: meal.ate_date.strftime("%F"), url: urln }
	    	meal_json.push(obj)
	    end
		render :json => meal_json
	end

	def daily_meal
		@user = User.find(params[:id])
		@_date = params[:commit]
		@date = params[:commit].split('-')
		@meals = Meal.where(user_id: current_user.id, ate_date: @_date).order(ate_time: "ASC")
		@meals.each do |meal|
			@urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
			# @ate_date = meal.ate_date.strftime("%Y年%-m月%-d日")
		end
	end

	def daily_meal_balance
		@user = User.find(params[:id])
		@date = params[:date]
		@m_date = params[:commit]
		@meals = Meal.where(user_id: current_user.id, ate_date: @date).order(ate_time: "ASC")
		@meals.each do |meal|
			@urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
		end
		@yellow_food_points = 0
		@red_food_points = 0
		@green_food_points = 0
		@goody_food_points = 0
		@alcohol_food_points = 0
		@meals.each do |meal|
			meal.food_points.each do |food_point|
				if food_point.food.food_color == "黄色"
				    @yellow_food_points += food_point.point
				elsif food_point.food.food_color == "赤色"
					@red_food_points += food_point.point
				elsif food_point.food.food_color == "緑色"
					@green_food_points += food_point.point
				elsif food_point.food.food_item == "菓子類"
					@goody_food_points += food_point.point
				elsif food_point.food.food_item == "お酒"
					@alcohol_food_points += food_point.point
				end
			end
		end
		gon.yellow_food_points = @yellow_food_points
		gon.red_food_points = @red_food_points
		gon.green_food_points = @green_food_points
	end

	def index
		@users = User.all
		# 検索オブジェクト
		@search = User.ransack(params[:q])
	end

	def create
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_setting_changing_path(current_user.id)
	    else
	    	render :edit
	    end
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.all.order(created_at: "DESC")
	end

	def follow(other_user)
		following << other_user
	end

	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	def following?(other_user)
		following.include?(other_user)
	end

	def following
		@user = User.find(params[:id])
		@users = @user.following
		@search = User.ransack(params[:q])
	end

	def followers
		@user = User.find(params[:id])
		@users = @user.followers
		@search = User.ransack(params[:q])
	end

	def user_search
				# 検索オブジェクト
		@users = User.all
		@search = User.ransack(params[:q])
		# 検索結果
		# @users = @search.result
	end

	def search_list
		# 検索オブジェクト
		@search = User.ransack(params[:q])
		# 検索結果
		@users = @search.result
	end

	def my_data
	end


	def setting_changing
	end

	private

	def user_params
		print params
		params.require(:user).permit(:profile_image, :introduction, targets_attributes: [:id, :target_body, :_destroy])
	end


end
