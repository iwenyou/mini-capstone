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

  def search
    search_term = params[:search]
    #ping database to find recipes that are similar to search term
    @product = Product.where("name LIKE ?", "%#{search_term}%")
    render :products
  end

  def products
    @product = Product.all

    if params[:sort]
     @product = Product.all.order(params[:sort] => params[:sort_order])
   end

   sale = params[:cheap]

   if sale
     @product = Product.where("price < ?", 60)
   end

   if params[:category]
     @product = Category.find_by(name: params[:category]).product
   end

   @categories = Category.all


  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier]['supplier_id']
      )
    @product.images.create(url: params[:image], product_id: @product.id)

      flash[:success] = "Product Created"
    redirect_to "/products/#{@product.id}"
  end



  def show
    product_id = params[:id]

    @product = Product.find_by(id: product_id)
#returns single instance supplier hash
    @supplier = @product.supplier
#returns array with image hashes
    @images = @product.images

    if product_id == "random"
      @product = Product.all.sample
    end

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
