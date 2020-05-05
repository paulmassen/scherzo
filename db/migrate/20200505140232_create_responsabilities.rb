class CreateResponsabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :responsabilities do |t|
      t.string :fonction
      t.references :contact, null: false, foreign_key: true
      t.references :structure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
