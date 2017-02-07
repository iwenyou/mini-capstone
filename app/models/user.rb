class User < ActiveRecord::Base
  has_secure_password
  has_many :products
  has_many :order
  has_many :carted_product

end
