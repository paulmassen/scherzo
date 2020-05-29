class AddFieldsToStructures < ActiveRecord::Migration[6.0]
  def change
    add_column :structures, :address2, :string
    add_column :structures, :postalcode, :string
    add_column :structures, :city, :string
    add_column :structures, :cedex, :string
    add_column :structures, :country, :string
    add_column :structures, :phone, :string
    add_column :structures, :email, :string
  end
end
