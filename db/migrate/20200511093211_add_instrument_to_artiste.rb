class AddInstrumentToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :instrument, :string
  end
end
