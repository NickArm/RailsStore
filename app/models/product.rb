class Product < ApplicationRecord
    validates :name, :product_category_id, presence: true
    belongs_to :product_category
  end
  
