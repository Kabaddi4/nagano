class Public::CartItemsController < ApplicationController
  def index
    
  end

  def create
    @item = Item.find(cart_item_params[:item_id])
    @item.save
    redirect_to
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
