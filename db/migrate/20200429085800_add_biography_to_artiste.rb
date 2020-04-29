class AddBiographyToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :biography, :text
  end
end
