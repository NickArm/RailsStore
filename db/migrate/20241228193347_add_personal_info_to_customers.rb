class AddPersonalInfoToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :phone, :string
    add_column :customers, :gender, :string
    add_column :customers, :birthday, :date
    add_column :customers, :address, :string
    add_column :customers, :postcode, :string
    add_column :customers, :city, :string
    add_column :customers, :country, :string
  end
end
