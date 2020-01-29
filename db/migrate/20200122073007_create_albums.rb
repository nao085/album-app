class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title,      null: false, default: ""
      t.references :user,   foregin_key: true
      t.timestamps null: false, foreign_key: true
    end
  end
end
