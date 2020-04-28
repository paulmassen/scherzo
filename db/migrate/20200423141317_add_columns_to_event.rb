class AddColumnsToEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :eventtype
      t.date :eventdate
      t.time :eventbegin
      t.time :eventend
      t.text :description1
      t.text :description2
      t.text :location
      t.timestamps
    end
  end
end
