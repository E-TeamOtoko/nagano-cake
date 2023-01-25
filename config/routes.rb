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
    resources :orders, only: [:index, :show, :update]
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    get "/items/genre/:id"=>"items#genre", as: "items_genre"
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
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get  'success'
      end
    end
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
