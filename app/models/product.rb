class Product < ApplicationRecord
 
# Name - presence - uniqueness
# Price - presence - numericality and not a negative number or 0
# Description - length of a minimum of 10 and a maximum of 500 characters
# Bonus: Do a web search to find out how to add a validation to make sure the image url is a valid file format (like .jpg, .png, etc.)
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {minimum: 10, maximum: 500}
  validates_format_of :image_url, :with => %r{\.(png|jpg|jpeg)$}i,:message => "must have a valid file type", multiline: true
  
  belongs_to :supplier
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
