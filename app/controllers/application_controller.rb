class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:employee_number,:last_name, :first_name, :last_name_reading, :first_name_reading, :nickname,:email])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:employee_number,:password])
  end
end