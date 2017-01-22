class ProductsController < ApplicationController

  def index

    @nike = Product.first

    @adidas = Product.second

    @nb = Product.third



    render "index.html.erb"
  end

  def show
    product_id = params[:id]

    @product = Product.find_by(id:product_id)

    render 'show.html.rb'
  end
end
