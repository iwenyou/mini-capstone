Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/index" => "products#index"

  get "/product/:id" => "products#show"
end
