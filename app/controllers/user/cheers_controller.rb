class User::CheersController < ApplicationController
	before_action :authenticate_user!
end
