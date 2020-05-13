class CreateJoinTableEngagementsContacts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :engagements, :contacts do |t|
      t.string :fonction
      t.boolean :maincontact
      t.index [:engagement_id, :contact_id]
      t.index [:contact_id, :engagement_id]
    end
  end
end
