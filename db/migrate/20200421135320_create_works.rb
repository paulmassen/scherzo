class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :opus
      t.string :composer
      t.integer :duration

      t.timestamps
    end
  end
end
