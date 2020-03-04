Rails.application.routes.draw do
  namespace :api do
    get "/myproducts" => "products#all_products"
    get "/myproduct" => "products#product1"
  end
end
