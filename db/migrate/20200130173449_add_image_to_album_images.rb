class AddImageToAlbumImages < ActiveRecord::Migration[6.0]
  def change
    add_column :album_images, :image, :string, null: false, default: ""
  end
end
