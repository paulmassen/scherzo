class AddVoyagesToEngagements < ActiveRecord::Migration[6.0]
  def change
    add_column :engagements, :voyages, :boolean
  end
end
