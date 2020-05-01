class CreateEngagementsStructures < ActiveRecord::Migration[6.0]
  def change
    create_table :engagements_structures, :id => false do |t|
      t.integer :engagement_id
      t.integer :structure_id

      t.timestamps
    end
  end
end
