class CreateProductVariations < ActiveRecord::Migration[8.0]
  def change
    create_table :product_variations do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
