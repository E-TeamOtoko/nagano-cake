Rails.application.routes.draw do
  root to: "items#new"
  devise_for :customers
  devise_for :admins

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
