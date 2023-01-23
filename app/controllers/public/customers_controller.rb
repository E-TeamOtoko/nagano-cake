class Public::CustomersController < ApplicationController
  
  
  def show
    @customer = Customer.find(params[:id])
    @customer = Customer.new
  end
  
  def edit
  end
  
  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "You have updated customer_info successfully."
    else
      render "edit"
    end
  end
  
  def confirm_withdraw
  end
  
  def withdraw
  end
  
end
