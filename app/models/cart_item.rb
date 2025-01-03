class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :product_variation, optional: true

  def total_price
    (product_variation&.price || product.price) * quantity
  end
end
