class Public::ItemsController < ApplicationController

  def index
    @items=Item.all.page(params[:page]).per(12)
    @genres=Genre.all
  end

  def show
    @additem=CartItem.new
    @item=Item.find(params[:id])
    @genres=Genre.all
  end

  def genre
    @genres=Genre.all
    @genre=Genre.find(params[:id])
    @items=@genre.items.page(params[:page]).per(8)
  end
  end
