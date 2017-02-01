Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/index" => "products#index"

  post "/search" => "products#search"

  get "/products" => "products#products"

  get "/products/new" => "products#new"

  post "/products" => "products#create"

  get "/products/:id" => "products#show"

  get "/products/:id/edit" => "products#edit"

  patch "/products/:id" => "products#update"

  delete "/products/:id" => "products#destory"

  get "/images/new" => "images#new"

  post "/images" => "images#create"

  get "/signup" => "users#new"

  post "/users" => "users#create"

  get  "users" => "users#users"

  get "/login" => "sessions#new"

  post "/login" => "sessions#create"

  get "/logout" => "sessions#destroy"
end
