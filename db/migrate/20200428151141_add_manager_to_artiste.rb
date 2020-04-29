class AddManagerToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :manager, :string
  end
end
