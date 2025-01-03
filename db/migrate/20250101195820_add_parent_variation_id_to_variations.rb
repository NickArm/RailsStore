class AddParentVariationIdToVariations < ActiveRecord::Migration[8.0]
  def change
    add_column :variations, :parent_variation_id, :integer
    add_foreign_key :variations, :variations, column: :parent_variation_id
    add_index :variations, :parent_variation_id
  end
end
