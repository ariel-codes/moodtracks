class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :spotify_id, null: false
      t.string :name, null: false
      t.string :artist, null: false
      t.string :thumbnail_url, null: false
      t.string :image_url, null: false
      t.float :danceability, null: false
      t.float :energy, null: false
      t.float :loudness, null: false
      t.float :tempo, null: false
      t.float :valence, null: false

      t.timestamps
    end
    add_index :tracks, :spotify_id, unique: true
  end
end
