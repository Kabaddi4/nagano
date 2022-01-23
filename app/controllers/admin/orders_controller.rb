class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
   
  end

  def show
    @order = Order.find(params[:id])
    @details = @order.order_details.all

    #@order_details = order.order_details.all

    #customer = Customer.find(params[:id])
    #orders = customer.orders.all
    #binding.pry
    #@orders = orders.order_details.all
  end
end
