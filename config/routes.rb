Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "" => "homes#top"
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    resources :items, only: [:index, :show]
    resources :cart_items do
      member do
       delete "destroy_all"
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
    end
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
