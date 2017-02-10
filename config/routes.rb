Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#index"

  resources :products

  resources :images

  resources :users

  #resources :session

  get "/login" => "sessions#new"

  post "/login" => "sessions#create"

  get "/logout" => "sessions#destroy"

  resources :order

  post "/cart" => "carted_products_controller#create"

  get "/cart/index" => "carted_products_controller#index"

  delete "/cart/:id" => "carted_products_controller#destroy"

end
