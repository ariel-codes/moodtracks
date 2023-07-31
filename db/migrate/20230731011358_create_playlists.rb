class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :spotify_id
      t.string :feature

      t.timestamps
    end
    add_index :playlists, :spotify_id, unique: true
    add_index :playlists, [:user_id, :feature], unique: true
  end
end
