class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(:id)
  end

  def unsubscribe
    @customer = Customer.find_by(id: params[:id])
  end

  def withdraw
    @customer = Customer.find_by(id: params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number)
  end
end
