# frozen_string_literal: true

class TracksFeature
  def initialize(user)
    @user = user
    @spotify_user = SpotifyUser.new(user)
  end

  def search(query)
    tracks = RSpotify::Track.search(query, limit: 5, market: {from: @spotify_user}).map do |track|
      images_by_resolution = track.album.images.sort_by { |image| image["height"] }
      Result::Track.new(
        spotify_id: track.id,
        name: track.name,
        artist: track.artists.map(&:name).join(", "),
        thumbnail_url: images_by_resolution.first["url"],
        image_url: images_by_resolution.last["url"]
      )
    end

    Result.new(tracks)
  end

  def save!(spotify_id:, name:, artist:, thumbnail_url:, image_url:)
    Track.transaction do
      local_track = Track.find_or_initialize_by(spotify_id:)
      if local_track.new_record?
        features = RSpotify::AudioFeatures.find(spotify_id)
        local_track.update!(
          name:,
          artist:,
          thumbnail_url:,
          image_url:,
          danceability: features.danceability,
          energy: features.energy,
          loudness: features.loudness,
          tempo: features.tempo,
          valence: features.valence
        )
      end
      UserTrack.create!(user:, track: local_track)
    end
  end

  class Result
    def initialize(tracks)
      @tracks = tracks
    end

    attr_reader :tracks

    Track = Data.define(:spotify_id, :name, :artist, :thumbnail_url, :image_url)
  end

  private

  attr_reader :user
end
