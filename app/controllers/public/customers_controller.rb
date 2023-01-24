class Public::CustomersController < ApplicationController
  
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
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
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone_number, :address, :postal_code)
  end
  
end
