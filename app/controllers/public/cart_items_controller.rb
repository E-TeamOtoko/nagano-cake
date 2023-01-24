class Public::CartItemsController < ApplicationController

  def index
    @cartitems=CartItem.all
  end

  def create
    @additem=CartItem.new(params_cart_item)
    @additem.save
    redirect_to public_cart_items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end
end
