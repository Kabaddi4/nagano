class ApplicationController < ActionController::Base

  #case whenで条件設定
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      customer_path(id)
    when Admin
      admin_customers_path
    end
  end
end
