class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @admin_customer = Customer.find(params[:id])
  end

  def edit
    @admin_customer = Customer.find(params[:id])
  end

  def update
    @admin_customer = Customer.find(params[:id])

    @admin_customer.update(customer_params)
    redirect_to admin_customers_path
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number, :email, :is_deleted)
  end

end
