class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_admin?, :is_user?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_admin?
    current_user && current_user.admin
  end

  def is_user?
    current_user
  end

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/index"
    end
  end

  before_action :calculate_cart_count

    private

      def calculate_cart_count
        if current_user
          @cart_count = current_user.carted_product.where(status: "carted").count
        else
          @cart_count = 0
        end
      end
end
