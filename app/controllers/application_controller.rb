class ApplicationController < ActionController::Base
  before_action :reject_inactive_customer, only: [:create]

  before_action :configure_permitted_parameters, if: :devise_controller?
  #case whenで条件設定
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_path(:id)
    when Admin
      admin_root_path
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end

  def reject_inactive_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
        flash[:notice] = "再度登録してください"
        redirect_to new_customer_session_path
      end
    end
  end
end
