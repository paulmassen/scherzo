class CreateJoinTableEngagementStructure < ActiveRecord::Migration[6.0]
  def change
    create_join_table :Engagements, :Structures do |t|
      t.index [:engagement_id, :structure_id]
      t.index [:structure_id, :engagement_id]
    end
  end
end
