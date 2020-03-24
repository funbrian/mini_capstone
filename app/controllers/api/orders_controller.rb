class Api::OrdersController < ApplicationController

  before_action :authenticate_user, except: [:show]

  def index
    @orders = current_user.orders
    render 'index_order.json.jb'
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    carted_products = current_user.CartedProduct.find_by(status: "carted")
    carted_products.each do |carted_product|
      subtotal = 0
      subtotal = carted_product.product_id * carted_product.quantity
    end
    subtotal = carted_product.each.subtotal
    tax_rate = 0.09
    tax = subtotal * tax_rate
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:input_product_id],
      quantity: params[:input_quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if params[:search] = "buy"
      carted_products.status = "Purchased"
    end
    if @order.save
      render 'show_order.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
