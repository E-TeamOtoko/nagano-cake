class Admin::CustomersController < ApplicationController
  
  def index
    #@customers = Customer.all
    @customers = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path(@customer), notice: "You have updated customer_info successfully."
    else
      render "edit"
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :address, :postal_code, :status)
  end
  
end
