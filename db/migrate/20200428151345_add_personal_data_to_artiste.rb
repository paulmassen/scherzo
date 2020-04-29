class AddPersonalDataToArtiste < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :birthplacecity, :string
    add_column :artistes, :birthplacedepartment, :string
    add_column :artistes, :birthplacecountry, :string
    add_column :artistes, :nationality, :string
    add_column :artistes, :familystatus, :string
    add_column :artistes, :maidenname, :string
    add_column :artistes, :socialsecurity, :string
    add_column :artistes, :congesspectacles, :string
    add_column :artistes, :audiens, :string
    
  end
end
