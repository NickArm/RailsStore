class Product < ApplicationRecord
    belongs_to :product_category
    has_and_belongs_to_many :tags

    has_one_attached :main_photo

    validates :name, presence: true
    validates :sku, presence: true, uniqueness: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
