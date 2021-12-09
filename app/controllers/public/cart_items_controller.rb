class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = CartItem.new
    item = Item.find(params[:cart_item][:item_id])
    cart_item.item_id = item.id
    cart_item.customer_id = current_customer.id
    cart_item.amount = params[:cart_item][:amount]
    if current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id]).present?
      plus_cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      sum = params[:cart_item][:amount]
      plus_cart_item.update(amount: plus_cart_item.amount += sum.to_i )   #update_attribute(amount)
      redirect_to cart_items_path
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end

  def destroy
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end