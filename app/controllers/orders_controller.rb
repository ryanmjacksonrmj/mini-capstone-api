class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def create
    carted_products = current_user.carted_products.where(status: "carted")
    @order = Order.create(
      user_id: current_user.id,
    )

    if @order.valid?
      carted_products.update_all(status: "purchased", order_id: @order.id)
      @order.update_totals
      render :show
    else
      render json: {errors: @order.errors.full_messages}, status: 422
    end
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render :show
  end

  def index
    @orders = current_user.orders
    render :index
  end
end
