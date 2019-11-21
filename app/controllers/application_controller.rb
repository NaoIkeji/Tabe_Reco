class ApplicationController < ActionController::Base
  protect_from_forgery
	before_action :configure_permitted_parameters, if: :devise_controller?

  	def after_sign_in_path_for(resource)
  		if params[:admin] == nil
  			 user_my_page_path(current_user.id)
  		else
  			 admin_home_top_path
  		end
  	end

  	protected
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    		user_params.permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :nickname, :email, :password)
    	end
  	end
end
