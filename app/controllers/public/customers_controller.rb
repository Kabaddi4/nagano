class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted, :created_at, :updated_at)
  end
end
