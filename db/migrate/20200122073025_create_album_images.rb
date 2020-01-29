class CreateAlbumImages < ActiveRecord::Migration[6.0]
  def change
    create_table :album_images do |t|
      t.references :album, foreign_key: true
      t.timestamps
    end
  end
end
