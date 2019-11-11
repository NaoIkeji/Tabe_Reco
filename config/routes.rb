Rails.application.routes.draw do

  namespace :user do
    get 'posts/index'
    get 'posts/new'
    get 'posts/show'
    get 'posts/edit'
  end
  get '/' => 'home#top', as: 'root'

namespace :user do
  get '/users/:id/my_page' => 'users#my_page', as: 'my_page'
  get '/users/:id/daily_meal' => 'users#daily_meal', as: 'daily_meal'
  # get '/users/daily_meal/:id/date[0]/date[1]/date[2]' => 'users#my_page', as: 'daily_meal'

  get '/users/:id/daily_meal_balance' => 'users#daily_meal_balance', as: 'daily_meal_balance'


  get '/meals/meal_indication' =>'meals#meal_indication', as: 'meal_indication'

	resources :meals
	resources :foods, only: [:create, :update, :edit, :destroy]
	resources :food_points, only: [:show, :new, :create, :update, :edit, :destroy]
  end

namespace :admin do
  get 'home/top' => 'home#top'
	resources :foods, only: [:index, :new, :create, :update, :edit, :destroy]
end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end