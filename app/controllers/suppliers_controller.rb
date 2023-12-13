class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render :index
  end
  def show
    @supplier = Supplier.find_by(id: params["id"])
    render template: "supplier/show"
  end
  def create
    @supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
    )
    render template: "products/show"

  end
  def update
    @supplier = Supplier.find_by(id: params["id"])
    @supplier.update(
      name: params["name"] || @supplier.name,
      email: params["email"] || @supplier.email,
      phone_number: params["phone_number"] || @supplier.phone_number
    )
    render template: "products/show"
  end
  def destroy
    supplier = Supplier.find_by(id: params["id"])
    supplier.destroy
    render json: { message: "Supplier has been destroyed." }
  end
end