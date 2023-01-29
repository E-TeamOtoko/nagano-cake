class Public::AddressesController < ApplicationController
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to  addresses_path(@customer), notice: "You have created address successfully."
    else
      @addresses = Address.all
      render :index
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to  addresses_path(@customer), notice: "You have updated address successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :address, :postal_code)
  end
  
  def ensure_correct_customer
    @address = Address.find(params[:id])
    unless @address.customer == current_customer
      redirect_to customer_path
    end
  end
  
  
end
