class AddVariationIdToProductVariations < ActiveRecord::Migration[8.0]
  def change
    add_column :product_variations, :variation_id, :integer
    add_index :product_variations, :variation_id
    add_foreign_key :product_variations, :variations
  end
end
