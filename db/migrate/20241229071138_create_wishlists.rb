class CreateWishlists < ActiveRecord::Migration[8.0]
  def change
    create_table :wishlists do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
