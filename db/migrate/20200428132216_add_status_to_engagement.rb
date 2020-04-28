class AddStatusToEngagement < ActiveRecord::Migration[6.0]
  def change
    add_column :engagements, :status, :string
  end
end
