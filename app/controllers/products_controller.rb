class ProductsController < ApplicationController

  def index

    @top_left = Product.first

    @top_middle = Product.second

    @top_right = Product.third



    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.create(
    name: params[:name],
    price: params[:price],
    description: params[:description])
    render "create.html.erb"
  end



  def show
    product_id = params[:id]

    @product = Product.find_by(id:product_id)

    render 'show.html.erb'
  end

  def edit
    product_id = params[:id]

    @product = Product.find_by(id: product_id)

    render "edit.html.erb"
  end

  def update
    product_id = params[:id]

    @product = Product.find_by(id: product_id)

    @product.name = params[:name]

    @product.save

    render "update.html.erb"

  end

  def destory
    product_id = params[:id]

    @product = Product.find_by(id: product_id)

    @product.destroy

    render "destory.html.erb"
  end

end
