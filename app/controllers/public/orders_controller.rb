class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    #注文情報をform経由で、カート情報はモデル経由で送る？
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.postal_code = params[:order][:postal_code]
    order.address = params[:order][:address]
    order.name = params[:order][:name]
    order.payment_method = params[:order][:payment_method]
    order.total_payment = params[:order][:total_payment]
    order.postage = 800
    order.status = "true"
    #保存

    order.save
    #カート内情報を保存
    cart_items = current_customer.cart_item.all

      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
        order_detail.making_status = 0
        order_detail.save
      end
    redirect_to :complete
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])#OrderDetail.find(params[:id])
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

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment)
  end

  def total_params
    params.require(:order).permit(:total_payment)
  end
end
