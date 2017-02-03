class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  def quantify(number,quantity)
    number * quantity.to_f
  end
end
