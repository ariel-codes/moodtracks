require "test_helper"
require "minitest/autorun"

class MoodPlaylistTest < ActiveSupport::TestCase
  def setup
    super
    @user = users(:one)
    @mock_spotify_user = Minitest::Mock.new
    SpotifyUser.stub :new, mock_spotify_user do
      @mood_playlist = MoodPlaylist.new(user)
    end
  end

  attr_reader :user, :mock_spotify_user, :mood_playlist

  test "should create Playlist" do
    user.playlists.delete_all

    playlist = Minitest::Mock.new
    playlist.expect :id, "123"
    playlist.expect :replace_image!, nil, [String, "image/jpeg"]

    mock_spotify_user.expect :create_playlist!, playlist,
      [MoodPlaylist::PLAYLIST_NAME], description: MoodPlaylist::PLAYLIST_DESCRIPTION, public: false

    assert_difference "user.playlists.count", 1 do
      mood_playlist.create_if_not_exists!
    end

    assert_mock mock_spotify_user
  end

  test "should not create Playlist if it already exists" do
    assert_no_difference "user.playlists.count" do
      mood_playlist.create_if_not_exists!
    end
  end
end
