class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    if params[:id] != "1000"
      @products = Category.find_by(id: params[:id]).products
    else
      @products = Product.where(active: true)
    end
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id],
      active: true,
    )
    if @product.valid?
      Image.create(url: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/310px-Placeholder_view_vector.svg.png", product_id: @product.id)
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
      supplier_id: params["supplier_id"] || @product.supplier_id,
    )
    if @product.valid?
      render template: "products/show"
    else
      render json: { errors: @product.errors.full_messages }, status: 422
    end
  end

  def destroy
    @product = Product.find_by(id: params["id"])
    if CartedProduct.where(product_id: @product.id, status: "carted") != []
      @products = CartedProduct.where(product_id: @product.id, status: "carted")
    end
    @product.update(active: false)
    if @products != nil
      @products.update_all(status: "deleted_product")
      render json: { message: "Product has been set to inactive." }
    end
  end
end
