class Admin::OrdersController < ApplicationController
    
    before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def current_user_order
    @orders = Order.where(customer_id: params[:id])
  end

  def show
    @order = Order.find(params[:id])
    @order_lists = @order.order_lists
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end

  private
  
  def order_params
    params.require(:order).permit(:status, :customer_id, :postal_code, :address, :invoice)
  end
end
