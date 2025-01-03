class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.string :name
      t.text :description
      t.string :admin_contact_email

      t.timestamps
    end
  end
end
