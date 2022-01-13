class Admin::OrdersController < ApplicationController

  def index
    @orders = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = OrderDetail.all
  end
end
