# frozen_string_literal: true

require "base64"

class MoodPlaylist
  PLAYLIST_NAME = "MoodTracks"
  PLAYLIST_DESCRIPTION = "Your mood registered through songs via MoodTracks.app"

  def initialize(user)
    @user = user
    @spotify_user = SpotifyUser.new(user)
  end

  def create_if_not_exists!
    return if @user.playlists.exists?(feature:)

    @playlist = @spotify_user.create_playlist!(PLAYLIST_NAME, description: PLAYLIST_DESCRIPTION, public: false)
    update_playlist_icon

    @user.playlists.create!(spotify_id: playlist.id, feature:)
  end

  private

  attr_reader :user, :spotify_user, :playlist

  def feature
    self.class.to_s
  end

  def update_playlist_icon
    image_bin = File.binread(Rails.root.join("app/assets/images/mood_playlist.jpg"))
    image_str = Base64.strict_encode64(image_bin)
    playlist.replace_image!(image_str, "image/jpeg")
  end
end
