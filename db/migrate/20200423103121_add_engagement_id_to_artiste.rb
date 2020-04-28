class AddEngagementIdToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :engagement, :reference
  end
end
