class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def cart_count
    if user_signed_in?
      @cart_count = current_user.carted_product.where(statue: "carted").count
    else
      @cart_count = 0
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end


end
