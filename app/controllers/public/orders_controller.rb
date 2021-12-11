class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create

  end

  def show

  end

  def confirm
    @order = Order.new(order_params)
    binding.pry #if params[:order][:status] == 1
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.customer_address
    @order.name = current_customer.last_name + current_customer.first_name
    #elsif params[:order][:status] == 2
    #@order.name = Address.find(params[:order][:registered]).name
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
