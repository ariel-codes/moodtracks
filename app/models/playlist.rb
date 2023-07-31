class Playlist < ApplicationRecord
  belongs_to :user

  validates :spotify_id, presence: true, uniqueness: true
  validates :feature, inclusion: [MoodPlaylist].map(&:to_s), uniqueness: {scope: :user_id}
end
