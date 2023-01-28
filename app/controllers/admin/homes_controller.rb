class Admin::HomesController < ApplicationController
  def top
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :tax_excluded_price, :genre_id, :sales_staus)
  end
end