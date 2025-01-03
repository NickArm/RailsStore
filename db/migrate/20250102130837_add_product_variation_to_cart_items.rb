class AddProductVariationToCartItems < ActiveRecord::Migration[8.0]
  def change
    add_column :cart_items, :product_variation_id, :integer
  end
end
