class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    binding.pry
  end

  def create
    cart_item = Item.find(cart_item_params[:item_id])
    cart_item.save
    redirect_to items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
