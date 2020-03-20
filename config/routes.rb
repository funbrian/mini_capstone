Rails.application.routes.draw do
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"
    post "/products" => "products#create"
    post "/users" => "users#create"
    post "/orders" => "orders#create"
    post "/sessions" => "sessions#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end
end
