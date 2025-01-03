class CreateProductVariationValues < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variation_values do |t|
      t.references :product_variation, null: false, foreign_key: true
      t.references :variation_value, null: false, foreign_key: true

      t.timestamps
    end
  end
end
