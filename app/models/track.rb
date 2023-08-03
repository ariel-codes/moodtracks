class Track < ApplicationRecord
  validates :spotify_id, presence: true, uniqueness: true
  validates :name, :artist, :thumbnail_url, :danceability, :energy, :loudness, :tempo, :valence,
    presence: true
end
