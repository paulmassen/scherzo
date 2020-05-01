class CreateArtistes < ActiveRecord::Migration[6.0]
  def change
    create_table :artistes do |t|
      t.string :name
      t.date :birthdate
      t.string :passportnumber
      t.date :passportdelivered
      t.date :passportexpire
      t.timestamps
    end
  end
end
