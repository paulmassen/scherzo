class AddAddressColumnToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :address, :text
  end
end
