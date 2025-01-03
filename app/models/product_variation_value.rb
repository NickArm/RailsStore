class ProductVariationValue < ApplicationRecord
  belongs_to :product_variation
  belongs_to :variation_value
end
