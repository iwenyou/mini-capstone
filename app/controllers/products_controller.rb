class ProductsController < ApplicationController

  def get_products

    @nike =Product.first



     render "products.html.erb"
  end
end
