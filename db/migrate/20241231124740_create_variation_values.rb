class CreateVariationValues < ActiveRecord::Migration[8.0]
  def change
    create_table :variation_values do |t|
      t.references :variation, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
