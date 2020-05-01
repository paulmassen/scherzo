class AddTypeToEngagements < ActiveRecord::Migration[6.0]
  def change
    add_column :engagements, :category, :string
  end
end
