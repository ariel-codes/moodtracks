class User < ApplicationRecord
  has_one :credential, dependent: :destroy
  has_many :playlists, dependent: :destroy

  validates :spotify_id, presence: true, uniqueness: true
  validates :name, :email, presence: true
end
