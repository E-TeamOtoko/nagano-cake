class Public::ItemsController < ApplicationController

  def index
    @items=Item.all.page(params[:page]).per(8)
    @items_all=Item.all
    @genres=Genre.all
  end

  def show
    @additem=CartItem.new
    @item=Item.find(params[:id])
    @genres=Genre.all
  end

  def genre
    @genre=Genre.find(params[:id])
    @genreitems=@genre.items.page(params[:page]).per(8)
    @genreitems_all=@genre.items
    @genres=Genre.all
  end

end
