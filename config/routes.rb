Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"
    get "/carted_products" => "carted_products#index"
    post "/products" => "products#create"
    post "/users" => "users#create"
    post "/orders" => "orders#create"
    post "/sessions" => "sessions#create"
    post "/carted_product" => "carted_products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end
