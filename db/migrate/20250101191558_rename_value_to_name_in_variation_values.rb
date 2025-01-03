class RenameValueToNameInVariationValues < ActiveRecord::Migration[8.0]
  def change
    rename_column :variation_values, :value, :name
  end
end
