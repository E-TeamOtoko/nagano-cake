class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: "DESC")
  end

  def about
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :tax_excluded_price)
  end
end