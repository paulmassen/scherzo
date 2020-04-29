class AddCarteToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :flightcompany, :string
  end
end
