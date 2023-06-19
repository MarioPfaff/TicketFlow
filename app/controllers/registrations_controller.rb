class RegistrationsController < Devise::RegistrationsController
  layout "login", only: [:new, :create]
  before_action :configure_account_update_params, only: [:update]
  before_action :configure_account_signup_params, only: [:create]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :last_name, :surname_prefix])
  end

  def configure_account_signup_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :surname_prefix])
  end
end
