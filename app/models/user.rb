class User < ApplicationRecord
  has_one :credential, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :user_tracks, dependent: :destroy
  has_many :tracks, through: :user_tracks

  validates :spotify_id, presence: true, uniqueness: true
  validates :name, :email, presence: true
end
