Rails.application.routes.draw do
  resources :reviews
  root :to => 'products#index'

  resource :cart, only: [:show]

  resources :products do
    resources :reviews
  end
  resources :order_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
