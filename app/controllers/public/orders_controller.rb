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
    binding.pry #params[:order][:status](何処が選択されたか) @order(Orderモデル)new_address = current_customer.addresses.new(address_params)
    @order = Order.new(order_params)
    if params[:order][:status] == 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.customer_address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:status] == 2
      @order.postal_code = Address.find(params[:order][:registered]).postal_code
      @order.address = Address.find(params[:order][:registered]).address
      @order.name = Address.find(params[:order][:registered]).name
    elsif params[:order][:status] == 3
      new_address = current_customer.addresses.new(address_params)  #あとここのみ。
    end
    @cart_items = current_customer.cart_item.all

  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

  def address_params
    params.require(:order).permit(:address, :name, :postage)
  end
end
