class Product < ApplicationRecord
    belongs_to :product_category
    has_and_belongs_to_many :tags

    has_one_attached :main_photo

    has_many :wishlists, dependent: :destroy
  has_many :customers_with_wishlist, through: :wishlists, source: :customer

  has_many :product_variations, dependent: :destroy
  accepts_nested_attributes_for :product_variations, allow_destroy: true


  validates :name, :price, :sku, presence: true
end
