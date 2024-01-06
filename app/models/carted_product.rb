class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order, optional: true

  def subtotal
    quantity.to_f * product.price.to_f
  end
end
