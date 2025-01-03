class Setting < ApplicationRecord
    validates :key, presence: true, uniqueness: true
    validates :value, presence: true

    def self.logo_url
        find_by(key: "logo_image")&.logo_image&.url || "default_logo_url"
      end
end
