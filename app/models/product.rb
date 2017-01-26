class Product < ApplicationRecord
  def sale_message
    if price.to_f < 2
      return "Discount item!"
    else
      return "Everyday value!"
    end
  end

  def tax
    return @tax = price.to_f * 0.09

  end

  def total
    return total = @tax + price.to_f

  end

end
