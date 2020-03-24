class Api::CartedProductsController < ApplicationController
  
  def index
    if current_user
      @carted_products = current_user.carted_products
    else
      @carted_products = []
    end
    render 'carted_index.json.jb'
  end

  def create
    @carted_product = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      user_id: current_user.id
    )
    if current_user
      @carted_product.save
    else
      @carted_products = []
    end
    render 'carted_show.json.jb'
  end
end
