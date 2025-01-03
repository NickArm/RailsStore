class ProductVariation < ApplicationRecord
  belongs_to :product
  belongs_to :variation
  has_many :product_variation_values, dependent: :destroy
  accepts_nested_attributes_for :product_variation_values, allow_destroy: true

  validates :price, :quantity, presence: true
end
