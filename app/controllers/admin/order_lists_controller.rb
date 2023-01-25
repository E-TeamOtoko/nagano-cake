class Admin::OrderListsController < ApplicationController
  
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end


  def update
    @order_list = OrderList.find(params[:id])
    @order_list.update(order_list_params)
  end

  private
  def order_list_params
    params.require(:order_list).permit(:production_status)
  end
  
end
