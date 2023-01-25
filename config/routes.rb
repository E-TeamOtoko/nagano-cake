Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :items
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :cart_items do
      member do
       delete "destroy_all"
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :customers
  end
  
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
