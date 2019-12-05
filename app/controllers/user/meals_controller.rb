class User::MealsController < ApplicationController
	before_action :authenticate_user!

	def meal_indication
	end

	def new
		@meal = Meal.new
		# @textはsubmitボタンに表示する文字
		@text = "食事を登録する"
		# @urlはform_forのオプションフォームの送信先を指定(createへ)
		@url = user_meals_path
	end

	def create
		@meal = Meal.new(meal_params)
		@meal.user_id = current_user.id
		if @meal.save
			@date = params[:commit]
			# 新規登録が保存できれば、ログインユーザーのxx年xx月xx日の食事一覧ページへ
            redirect_to user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + @meal.ate_date.strftime("%F")
        else
         @text = "食事を登録する"
         @url = user_meals_path
         render :new
         # return
       end
	end

	def edit
		@meal = Meal.find(params[:id])
		# @textはsubmitボタンに表示する文字
		@text = "食事を編集する"
		# @urlはform_forのオプションフォームの送信先を指定(updateへ)
		@url = "/user/meals/#{@meal.id}"
	end

	def update
		@meal = Meal.find(params[:id])
		if @meal.update(meal_params)
			# updateできたら、ログインユーザーのxx年xx月xx日の食事一覧ページへ
		   redirect_to user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + @meal.ate_date.strftime("%F")
		else
			@url = "/user/meals/#{@meal.id}"
			render :edit
		end
	end

	def destroy
		meal = Meal.find(params[:id])
		Meal.find(params[:id]).destroy
		redirect_to user_daily_meal_path(current_user.id)+"?utf8=%E2%9C%93&commit=" + meal.ate_date.strftime("%F")
	end

	private
	def meal_params
		params.require(:meal).permit(:ate_date, :ate_time, :meal_item, :meal_image, :meal_text, food_points_attributes: [:id, :meal_id, :food_id, :point, :_destroy])
	end
end
