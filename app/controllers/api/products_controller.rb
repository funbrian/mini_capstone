class Api::ProductsController < ApplicationController
  def all_products
    @product = Product.all
    render 'show_products.json.jb'
  end

  def product1
    @product1 = Product.first
    render 'first_product.json.jb'
  end
end
