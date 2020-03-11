class Api::ProductsController < ApplicationController
  def index
    @products = Product.all 
    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      description: params[:input_desc],
      price: params[:input_price],
      image_url: params[:image_url]
    )
    @product.save
    render 'show.json.jb'
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.name = params[:input_name]
    @product.description = params[:input_desc] 
    @product.price = params[:input_price]
    @product.image_url = params[:image_url] 
    @product.save
    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render 'destroy.json.jb'
  end
end
