class CartedProductsControllerController < ApplicationController

  def create
    product_id = params[:product_id]

    quantity = params[:quantity]

    product = Product.find_by(id: product_id)

    carted = CartedProduct.create(
    quantity: quantity,
    user_id: current_user.id,
    product_id: product_id,
    status: "carted"
    )

    flash[:success] = "Product added to cart"
    redirect_to "/cart/index"
  end

  def index
    @user = current_user.id
    @carted_products = CartedProduct.where(user_id: @user,status: "carted")
  end


  def destroy
    carted_product_id = params[:id]
    @carted_product = CartedProduct.find_by(id: carted_product_id)
    @carted_product.status = "removed"
    @carted_product.save
    flash[:success] = "Product removed from cart"
    redirect_to "/cart/index"
  end

end
