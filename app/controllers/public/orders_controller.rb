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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    
    if params[:order_address] == "option1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order_address] == "option2"
      @address = Address.find(params[:order][:select_address])
      @order.address = @address.address
      @order.name = @address.name
      @order.postal_code = @address.postal_code
    elsif params[:order_address] == "option3"
    end

    @cart_items=current_customer.cart_items
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    
    current_customer.cart_items.each do |cart_item|
      @order_list = OrderList.new
      @order_list.order_id = @order.id
      @order_list.item_id = cart_item.item_id
      @order_list.item_price = cart_item.item_price
      @order_list.quantity = cart_item.quantity
      @order_list.save!
    end

    current_customer.cart_items.destroy_all

    redirect_to success_orders_path
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :invoice, :postal_code, :address, :name)
  end

end
