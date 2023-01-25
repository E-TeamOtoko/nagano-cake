class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
    
  def show
    @order = Order.find(params[:id])
    @order_lists = @order.order_lists
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def success
  end
  
  def confirm
  end
  
  def create
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :invoice, :postal_code, :address, :name)
  end

end
