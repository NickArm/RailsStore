class Customer < ApplicationRecord
    has_secure_password

    has_many :wishlists, dependent: :destroy
    has_many :wishlist_products, through: :wishlists, source: :product

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, confirmation: true, allow_blank: true
end
