class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name phone address])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name phone address])
  end
end
