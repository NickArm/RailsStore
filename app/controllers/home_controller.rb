class HomeController < ApplicationController
  def index
    @products = Product.all
    @wishlist_product_ids = current_customer&.wishlist_products&.pluck(:id) || []
  end
end
