class AddColorToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :color, :string
  end
end
