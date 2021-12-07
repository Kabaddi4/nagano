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

  private
  def order_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :name, :postage, :total_payment, :payment_method, :status, :created_at, :updated_at)
  end
end
