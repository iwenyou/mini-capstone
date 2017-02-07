class OrderController < ApplicationController

  def create
    @user = current_user.id

    @carted_products = CartedProduct.where(user_id: @user,status: "carted")

    order = Order.create(
    user_id: @user,
    subtotal: calculate_subtotal(@carted_products),
    tax: (subtotal * 0.09),
    total: (subtotal + tax)
    )

    flash[:success] = "Order Created"
    redirect_to "/order/#{order.id}"
  end

  def show
    order_id = params[:id]

    @order = Order.find_by(id: order_id)

  end

end
