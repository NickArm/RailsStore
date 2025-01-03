class Variation < ApplicationRecord
  has_many :variation_values, dependent: :destroy
  has_many :product_variation_values, through: :variation_values
  has_many :product_variations, through: :product_variation_values

  before_destroy :check_product_associations

  validates :name, presence: true, uniqueness: true # Ensure variation names are unique

  # Virtual attribute to handle comma-separated input for variation values
  attr_accessor :variation_values_input

  before_save :process_variation_values_input

  private

  # Prevent deletion of a variation if it's associated with any product
  def check_product_associations
    if product_variations.exists?
      errors.add(:base, "Cannot delete a variation that is used by products.")
      throw(:abort)
    end
  end

  # Process the variation values input to handle comma-separated values
  def process_variation_values_input
    return if variation_values_input.blank?

    # Clear existing variation values
    variation_values.destroy_all

    # Split input into individual values and create new variation values
    variation_values_input.split(";").each do |value|
      next if value.strip.blank? # Skip blank values
      variation_values.build(name: value.strip) # Ensure `name` is used consistently
    end
  end
end
