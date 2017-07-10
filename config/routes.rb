Rails.application.routes.draw do
  root :to => 'products#index'

  resource :cart, only: [:show]

  resources :products
  resources :order_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
