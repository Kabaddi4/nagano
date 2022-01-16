class Admin::OrdersController < ApplicationController

  def index
    @orders = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    current_orders = OrderDetail.all
    binding.pry
    @orders = @order.current_orders
  end
end
