Rails.application.routes.draw do
  get "/products", controller: "products", action: "all_products"
end
