class Wishlist < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :customer_id, uniqueness: { scope: :product_id, message: "already added this product to wishlist" }
end
