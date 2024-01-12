require "test_helper"

class CartedProductsControllerTest < ActionDispatch::IntegrationTest
  require "test_helper"

  class CartedProductsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @user = User.create(name: "Test", email: "test@test.com", password: "password")
      @supplier = Supplier.create(name: "Store", email: "store@test.com", phone_number: "3223232")
      @product = Product.create(supplier_id: @supplier.id, name: "Item", price: 10, description: "this is an item")
      @carted_product = CartedProduct.create(user_id: @user.id, product_id: @product.id, quantity: 2, status: "carted")
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      data = JSON.parse(response.body)
      @jwt = data["jwt"]
    end
  end
end
