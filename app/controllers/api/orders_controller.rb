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
    product = Product.find_by(id: params[:input_product_id])
    subtotal = params[:input_quantity].to_i * product.price
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
    if @order.save
      render 'show_order.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end