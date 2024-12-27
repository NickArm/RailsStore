class Product < ApplicationRecord
    belongs_to :product_category

    validates :name, presence: true
    validates :sku, presence: true, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  end
  
