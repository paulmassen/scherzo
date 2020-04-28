class AddProgrammeToEngagements < ActiveRecord::Migration[6.0]
  def change
    add_reference :engagements, :programme, foreign_key: true
  end
end
