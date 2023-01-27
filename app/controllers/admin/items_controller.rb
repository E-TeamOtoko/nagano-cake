class Admin::ItemsController < ApplicationController
  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def index
    @items=Item.all.page(params[:page]).per(10)
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :genre_id, :item_name, :item_introduction, :tax_excluded_price, :sales_status)
  end
end
