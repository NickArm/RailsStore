class AddDetailsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :sku, :string
    add_column :products, :description, :text
    add_column :products, :price, :decimal
    add_column :products, :quantity, :integer
  end
end
