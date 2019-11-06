Rails.application.routes.draw do

namespace :user do
	resources :meals
	resources :foods, only: [:create, :update, :edit, :destroy]
	resources :food_points, only: [:new, :create, :update, :edit, :destroy]
  end

namespace :admin do
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