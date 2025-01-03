class ApplicationController < ActionController::Base
  helper_method :current_user, :current_customer, :current_cart_count
  before_action :load_categories_and_tags
  protect_from_forgery with: :exception

  # Current user (admin or general user)
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Current customer
  def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end

  # Authentication for admin and users
  def authenticated?
    !!current_user
  end

  # Authentication for customers
  def authenticate_customer!
    unless current_customer
      redirect_to new_customer_session_path, alert: "You need to sign in to access this page."
    end
  end

  private

  def current_cart_count
    cart = Cart.find_by(id: session[:cart_id])
    return 0 unless cart # If no cart exists, return 0

    cart.cart_items.sum(:quantity) || 0
  end


  # Load categories and tags for navigation or other purposes
  def load_categories_and_tags
    @categories = ProductCategory.all
    @tags = Tag.all
  end
end
