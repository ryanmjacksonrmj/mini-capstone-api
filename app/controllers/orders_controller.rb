class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:create, :show]
  def create
    product = Product.find_by(id: params["product_id"])
    subtotal = params["quantity"].to_i * product.price
    tax = subtotal * 0.10
    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: tax + subtotal
    )
    render :show
  end

  def show
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = Order.all
    render :index
  end


end
