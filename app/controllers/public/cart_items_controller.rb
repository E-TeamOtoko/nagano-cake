class Public::CartItemsController < ApplicationController

  def index
    @cartitems=CartItem.all
  end

  def create
    @additem=CartItem.new(cart_item_params)
    @additem.save!
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end
end
