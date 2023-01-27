class Public::ItemsController < ApplicationController

  def index
    @items=Item.all
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
  end
  end
