class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
  end

  def add_item
    @cart ||= initialize_cart
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = (cart_item.quantity || 0) + 1

    if cart_item.save
      redirect_to cart_path, notice: "#{product.name} was added to your cart."
    else
      redirect_to product_path(product), alert: "Failed to add item to cart."
    end
  end


    def remove_item
      cart_item = @cart.cart_items.find_by(id: params[:id])
      if cart_item
        cart_item.destroy
        redirect_to cart_path, notice: "#{cart_item.product.name} was removed from your cart."
      else
        redirect_to cart_path, alert: "Item not found in the cart."
      end
    end


  def clear
    @cart.cart_items.destroy_all

    redirect_to cart_path, notice: "Your cart was cleared."
  end


  private


  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= @cart.id
  end
end
