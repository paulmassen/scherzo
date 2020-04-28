class AddEngagementIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :engagement, foreign_key: true
  end
end
