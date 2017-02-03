class OrderController < ApplicationController

  def create
    product_id = params[:product_id]

    quantity = params[:quantity]

    product = Product.find_by(id: product_id)

    order = Order.create(
    quantity: quantity,
    user_id: current_user.id,
    product_id: product_id,
    subtotal: (product.price * quantity.to_f),
    tax: (product.tax * quantity.to_f),
    total: (product.total * quantity.to_f)
    )

    flash[:success] = "Order Created"
    redirect_to "/order/#{order.id}"
  end

  def show
    order_id = params[:id]

    @order = Order.find_by(id: order_id)

  end

end
