class ProductsController < ApplicationController

  def get_products

    @nike = Product.first

    @adidas = Product.second

    @nb = Product.third



    render "products.html.erb"
  end
end
