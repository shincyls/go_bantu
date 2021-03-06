class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

add_flash_types :danger, :info , :warning , :success

  protected

      def configure_permitted_parameters
        added_attrs = [:first_name, :last_name,:avatar,:username,:email,:remember_me]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      end
end
