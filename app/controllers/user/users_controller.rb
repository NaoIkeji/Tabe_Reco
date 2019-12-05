class User::UsersController < ApplicationController
	before_action :authenticate_user!

	# my_pageにはカレンダーを表示
	def my_page
		#まずは同じ食事日時のものをselectする whereでログインユーザーを取得
		#distinctで食事の日付の重複をひとつににまとめて、1日の食事情報を取得する
		@meals = Meal.select(:ate_date).where(user_id: current_user.id).distinct
		@targets = Target.where(user_id: current_user.id)
	end

	def json
		@meals = Meal.select(:ate_date).where(user_id: current_user.id).distinct
		#空の配列を準備する
		meal_json=[]
		@meals.each do |meal|
			# urlnはログインユーザーのxx年xx月xx日の食事一覧ページのURL
			urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
			# titleには登録済み、startには食事をした日付、urlにはログインユーザーのxx年xx月xx日の食事一覧ページのURL のデータを渡す
	   		obj = {title: '登録済み', start: meal.ate_date.strftime("%F"), url: urln }
	   		# meal_jsonという変数に{title: '登録済み', start: meal.ate_date.strftime("%F"), url: urln }をaddしていく処理
	   		# meal_jsonの配列にobjの要素を追加していく
	    	meal_json.push(obj)
	    end
	    # JSON形式で出力を行うために、meal_jsonオブジェクトをjson形式に変換した上で返す
		render :json => meal_json
	end

	# ログインユーザーのxx年xx月xx日の食事一覧ページ
	def daily_meal
		@user = User.find(params[:id])
		# @_dateはパラメーターのcommitを取得 commitはmeal.ate_date.strftime("%F") (例）2019-11-01 を取得する
		@_date = params[:commit]
		# パラメーターから取得したcommit (例)2019-11-01を2019年11月1日で表示させたい
		# 2019 11 01 に分けたい → split メソッドで文字列を分割して配列にする
		@date = params[:commit].split('-')
		# ログインユーザーのxx年xx月xx日の食事を取得し、食事時間が早い順に表示させる
		@meals = Meal.where(user_id: current_user.id, ate_date: @_date).order(ate_time: "ASC")

		# @meals.each do |meal|
		# 	@urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
		# end
	end

	# ログインユーザーのxx年xx月xx日の栄養バランスページ
	def daily_meal_balance
		@user = User.find(params[:id])
		# @dateはパラメーターのdateを取得
		@date = params[:date]
		# @m_dateはパラメーターのcommitを取得
		@m_date = params[:commit]
		@meals = Meal.where(user_id: current_user.id, ate_date: @date).order(ate_time: "ASC")
		# meal.ate_dateを取得したいため、mealsを分解
		@meals.each do |meal|
			# urlnはログインユーザーのxx年xx月xx日の食事一覧ページのURL
			@urln = user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
		end
		# 初期値を設定
		@yellow_food_points = 0
		@red_food_points = 0
		@green_food_points = 0
		@goody_food_points = 0
		@alcohol_food_points = 0
		@meals.each do |meal|
			# mealのfood_pointsを一つずつ取り出す
			meal.food_points.each do |food_point|
				# 黄色に分類された食品ならば、黄色の点数を足していく
				if food_point.food.food_color == "黄色"
				    @yellow_food_points += food_point.point
				# 赤色に分類された食品ならば、赤色の点数を足していく
				elsif food_point.food.food_color == "赤色"
					@red_food_points += food_point.point
				# 緑色に分類された食品ならば、緑色の点数を足していく
				elsif food_point.food.food_color == "緑色"
					@green_food_points += food_point.point
				# 菓子類の食品であれば、菓子類に点数を足していく
				elsif food_point.food.food_item == "菓子類"
					@goody_food_points += food_point.point
				# お酒の食品であれば、お酒の点数を足していく
				elsif food_point.food.food_item == "お酒"
					@alcohol_food_points += food_point.point
				end
			end
		end
		# 食品を黄色、赤色、緑色グループに分けて合計点数を取得し、レーダーチャート化したい
		# Gemのgonを使用するとRailsとJavaScriptを連携させることができる
		# 変数の頭にgonをつけると、コントローラー内で使用した変数をavaScript内で使うことが可能になる
		gon.yellow_food_points = @yellow_food_points
		gon.red_food_points = @red_food_points
		gon.green_food_points = @green_food_points
	end

	def index
		@users = User.all
		# 検索オブジェクト
		@search = User.ransack(params[:q])
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

	def search_list
		# 検索オブジェクト
		@search = User.ransack(params[:q])
		# 検索結果
		@users = @search.result
	end


	def setting_changing
	end

	private

	def user_params
		print params
		params.require(:user).permit(:profile_image, :introduction, targets_attributes: [:id, :target_body, :_destroy])
	end


end
