class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :catagorized_products
  has_many :category, through: :catagorized_products
  has_many :carted_product

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { maximum: 500 }
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }


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

  def divide_description
    return description.split(",")
  end

end
