class ImagesController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    product_id = params[:product_id]
    image = Image.create(
    url: params[:url],
    product_id: product_id)
    flash[:success] = "Image Successly created!"
    redirect_to "/products/#{product_id}"
  end
end
