class ProductsController < ApplicationController

  def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1
    @visit_count = session[:count]
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

  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price]

      )
      flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end



  def show
    @product = Product.find_by(id: params[:id])
#returns single instance supplier hash
    @supplier = @product.supplier
#returns array with image hashes
    @images = @product.images

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
