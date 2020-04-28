class CreateProgrammes < ActiveRecord::Migration[6.0]
  def change
    create_table :programmes do |t|
      t.string :title

      t.timestamps
    end
  end
end
