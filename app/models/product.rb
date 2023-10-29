class Product < ApplicationRecord
  def is_discounted?
    if price <= 10
      return true
    else
      false
    end
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end

end
