class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  #case whenで条件設定
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_path(:id)
    when Admin
      admin_customers_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end
end
