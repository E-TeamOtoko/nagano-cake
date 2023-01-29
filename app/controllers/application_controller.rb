class ApplicationController < ActionController::Base
  #before_action :authenticate_customer!, except: [:sign_in, :sign_up, :top, :about]
  #before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  
  def after_sign_in_path_for(resource)
    customer_path(id: current_customer)
  end

  def after_sign_out_path_for(resource)
    root_path
    #new_customer_session_path
  end

end