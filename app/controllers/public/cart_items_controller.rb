class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    cart_item = CartItem.new
    item = Item.find(params[:cart_item][:item_id])
    cart_item.item_id = item.id
    cart_item.customer_id = current_customer.id
    cart_item.amount = params[:cart_item][:amount] #目からウロコ。直接取得できる。
    if CartItem.find_by(id: CartItem.ids)
      #カートアイテムの重複してる商品の情報を取り出し、取得した数(amount)を加算する。
    else
      cart_item.save
      redirect_to items_path
    end
  end

  def destroy

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end