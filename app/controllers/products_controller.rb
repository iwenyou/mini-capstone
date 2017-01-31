class ProductsController < ApplicationController

  def index
    @product = Product.all

    render "index.html.erb"
  end

  def products
    @product = Product.all

    if params[:sort]
     @product = Product.all.order(params[:sort] => params[:sort_order])
   end

   if params[:discount]
     @product = Product.where("price < ?", 50)
   end

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

    if product_id == "random"
      @product = Product.all.sample
    end



    render 'show.html.erb'
  end

  def search
    search_term = params[:seach]
    @product = Product.where("name LIKE ?", "%#{search_term}%")

    render :products

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
