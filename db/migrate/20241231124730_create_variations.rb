class CreateVariations < ActiveRecord::Migration[8.0]
  def change
    create_table :variations do |t|
      t.string :name

      t.timestamps
    end
  end
end
