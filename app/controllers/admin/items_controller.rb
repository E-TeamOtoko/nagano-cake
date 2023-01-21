class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to item_path(@item.id)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.requier(:items).permit(:image, :genre, :item_name, :item_introduction, :tax_excluded_price, :sales_status)
  end
end
