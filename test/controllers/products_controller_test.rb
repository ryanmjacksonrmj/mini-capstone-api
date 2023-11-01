require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
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
    assert_equal ["id", "name", "price", "description", "image_url", "is_discounted?", "tax", "total", "supplier"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "Book 234", price: 85, image_url: "http://test.com/test.jpg", description: "N/A N/A N/A", supplier_id: Supplier.first.id }
    end
    assert_difference "Product.count", 0 do
      post "/products.json", params: {}
      assert_response 422
    end  
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Update.This.Name." }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Update.This.Name.", data["name"]
    assert_equal product.price.to_s, data["price"]
    assert_equal product.image_url, data["image_url"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
