class AddProgrammeIdToWork < ActiveRecord::Migration[6.0]
  def change
    add_reference :works, :programme, foreign_key: true
  end
end
