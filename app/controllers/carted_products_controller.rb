class CartedProductsController < ApplicationController
  def create
    if CartedProduct.where(user_id: current_user.id, product_id: params[:product_id]) == nil
      @carted_product = CartedProduct.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: "carted",
        order_id: nil,
      )
      render :show
    else
      @carted_product = CartedProduct.find_by(user_id: current_user.id, product_id: params[:product_id])
      @carted_product.update(
        user_id: current_user.id,
        product_id: @carted_product.product_id,
        quantity: (@carted_product.quantity + (params[:quantity].to_i)),
        status: @carted_product.status,
      )
    end
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def destroy
    carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")
    carted_product.update(status: "removed")
    render json: { status: "Carted item removed" }
  end
end
