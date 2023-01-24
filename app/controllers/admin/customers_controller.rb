class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
    @customer = Customer.new
  end
  
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
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :address, :postal_code)
  end
  
end
