class ApplicationController < ActionController::Base

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:avatar,:username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:avatar,:username])
      end
end
