class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  def index
    #@products = Product.where('name LIKE ?', "%#{params[:search]}%")
    #if params[:discount] == 'true'
      #@products = Product.where("price < 10") 
    #end
    #if params[:sort] && params[:sort_order]
      #@products = @products.order(params[:sort] => params[:sort_order])
    #else
      #@products = @products.order(:id)
    #end
    category = Category.find_by(name: params[:search])
    @products = category.products
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
      #image_url: params[:image_url], 
      supplier_id: params[:supplier_id],
      #category: params[:input_category],
      user_id: current_user.id,
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.name = params[:input_name] || @product.name
    @product.description = params[:input_desc] || @product.description
    @product.price = params[:input_price] || @product.price
    @product.category = params[:input_category] || @product.category
    #@product.image_url = params[:image_url] || @product.image_url
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render 'destroy.json.jb'
  end
end
