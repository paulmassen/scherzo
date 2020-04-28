class AddImageDataToArtistes < ActiveRecord::Migration[6.0]
  def change
    add_column :artistes, :image_data, :text
  end
end
