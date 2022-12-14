class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :welcome

  def after_sign_in_path_for(_groups)
    groups_path
  end

  def after_sign_up_path_for(_groups)
    groups_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
