class WishlistsController < ApplicationController
    before_action :authenticate_customer!

    def create
      product = Product.find(params[:product_id])
      current_customer.wishlist_products << product
      redirect_to root_path, notice: "#{product.name} has been added to your wishlist."
    end

    def destroy
      wishlist_item = current_customer.wishlists.find_by(product_id: params[:id])
      if wishlist_item
        wishlist_item.destroy
        redirect_to root_path, notice: "Product has been removed from your wishlist."
      else
        redirect_to root_path, alert: "Product not found in your wishlist."
      end
    end
end
