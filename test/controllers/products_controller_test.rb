require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "test@test.com", password: "password", admin: true)
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "is_discounted?", "tax", "total", "supplier", "images"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", 
      headers: {"Authorization" => "Bearer #{@jwt}"},
      params: { name: "Book 234", price: 85, description: "N/A N/A N/A", supplier_id: Supplier.first.id }
    end
    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end  
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
      headers: {"Authorization" => "Bearer #{@jwt}"},
      params: { name: "Update.This.Name." }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Update.This.Name.", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
        headers: {"Authorization" => "Bearer ${@jwt}"}
      assert_response 200
    end
    
    delete "/products/#{Product.first.id}.json"
    assert_response 401
  end
end
