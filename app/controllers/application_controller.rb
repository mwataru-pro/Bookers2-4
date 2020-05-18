class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	#sign inした後の遷移先指定
	def after_sign_in_path_for(resource)
		user_path(resource)
	end
	#log outした後の遷移先指定
	def after_sign_out_path_for(resource)
      root_path
    end

   protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end

end