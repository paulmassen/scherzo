class AddDetailsToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :address, :string
    add_column :contacts, :address2, :string
    add_column :contacts, :codepostal, :string
    add_column :contacts, :ville, :string
    add_column :contacts, :cedex, :string
    add_column :contacts, :pays, :string
  end
end
