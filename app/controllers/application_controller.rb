class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  @categories = Category.all

  private

  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[shop_name phone address desc tax_code])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[shop_name phone address desc tax_code])
  end
end
