class AddLogoToSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :key, :string
    add_column :settings, :value, :text
  end
end
