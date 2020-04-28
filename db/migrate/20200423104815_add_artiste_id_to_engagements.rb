class AddArtisteIdToEngagements < ActiveRecord::Migration[6.0]
  def change
    add_reference :engagements, :artiste, foreign_key: true
  end
end
