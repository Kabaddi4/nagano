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
     #params[:order][:status](何処が選択されたか) @order(Orderモデル)new_address = current_customer.addresses.new(address_params)
    if params[:order][:status] == "1"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.customer_address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:status] == "2"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:registered])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:status] == "3"
      @order = Order.new(order_params)
    else
      render :new
    end
    @cart_items = current_customer.cart_item.all
    @total = 0
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
