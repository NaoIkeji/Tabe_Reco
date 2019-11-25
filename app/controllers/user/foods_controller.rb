class User::FoodsController < ApplicationController
	before_action :authenticate_user!
end
