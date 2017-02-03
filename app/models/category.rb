class Category < ApplicationRecord
  has_many :catagorized_products
  has_many :product, through: :catagorized_products
end
