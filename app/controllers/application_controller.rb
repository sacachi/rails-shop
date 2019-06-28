class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[shop_name phone address desc tax_code])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[shop_name phone address desc tax_code])
  end
end
