class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_product

  def quantify(number,quantity)
    number * quantity.to_f
  end

  def calculate_subtotal(products)
    subtotal = 0

    products.each do |product|
      subtotal = product.product.price * product.quantity + subtotal
    end

    return subtotal
  end
end
