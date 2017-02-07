class OrderController < ApplicationController

  def create
    user_id = current_user.id

    carted_products = CartedProduct.where(user_id: user_id,status: "carted")

    order = Order.new(user_id: user_id)
    order.subtotal = order.calculate_subtotal(carted_products)
    order.tax = order.subtotal * 0.09
    order.total = order.subtotal + order.tax

    order.save

    # carted_products.each do |product|
    #   product.status = "purchased"
    #   product.order_id = order.id
    #   product.save
    # end

    carted_products.update_all(status: 'pruchased', order_id: order.id)

    flash[:success] = "Order Created"
    redirect_to "/order/#{order.id}"
  end

  def show
    order_id = params[:id]

    @order = Order.find_by(id: order_id)

    @products = CartedProduct.where(order_id: order_id)

  end

end
