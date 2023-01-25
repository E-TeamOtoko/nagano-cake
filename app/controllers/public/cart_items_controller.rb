class Public::CartItemsController < ApplicationController

  def index
    @cartitems=CartItem.all
    @pricesum=0
  end

  def create
    @additem=CartItem.new(cart_item_params)
    @additem.save!
    redirect_to cart_items_path
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end
end
