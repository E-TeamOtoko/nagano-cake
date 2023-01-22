Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  get "admin/items/test" => "admin/items#index"
  get "admin/items/new" => "admin/items#new"
  post "admin/items" => "admin/items#create"
  
  #scope "/admin" do
    #resources :items, only[:index, :show, :edit, :update]
  #end 
  scope "/public" do
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
