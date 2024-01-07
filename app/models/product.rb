class Product < ApplicationRecord
 
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {minimum: 10, maximum: 500}

  
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products 
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
