class CreateEngagements < ActiveRecord::Migration[6.0]
  def change
    create_table :engagements do |t|
      t.string :title
      t.date :begin
      t.date :end
      t.boolean :contract
      t.boolean :hotel
      t.boolean :taxi
      t.boolean :sent
      t.boolean :rehearsals
      t.timestamps
    end
  end
end
