class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    
  end

  def update
  end

  private
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted, :created_at, :updated_at)
  end

end
