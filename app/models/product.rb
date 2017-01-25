class Product < ApplicationRecord
  def product_list
    return products.split(",")
  end

  def description_list
    return description.split(",")
  end

end
