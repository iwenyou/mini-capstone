class ProductsController < ApplicationController

  def index
    @product = Product.all

    render "index.html.erb"
  end

  def products
    @product = Product.all

    render "products.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.create(
    name: params[:name],
    price: params[:price],
    description: params[:description])
    flash[:success] = "Product Successly created!"
    redirect_to "/products"
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

    flash[:success] = "Product Successly updated!"

    redirect_to "/products/@product_id"

  end

  def destory
    product_id = params[:id]

    @product = Product.find_by(id: product_id)

    @product.destroy

    flash[:warning] = "Product deleted!"

    redirect_to "/products"
  end

end
