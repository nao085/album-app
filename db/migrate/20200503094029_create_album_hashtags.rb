class CreateAlbumsHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :albums_hashtags, id: false do |t|
      t.references :album, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
