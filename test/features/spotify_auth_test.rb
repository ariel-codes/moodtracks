require "test_helper"

class SpotifyAuthTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "#signin_or_signup_user should create user" do
    auth_hash = OmniAuth.config.mock_auth[:spotify]

    assert_difference "User.count", 1 do
      SpotifyAuth.new.signin_or_signup_user(auth_hash)
    end
  end

  test "#signin_or_signup_user should update user" do
    auth_hash = OmniAuth.config.mock_auth[:spotify]
    user = users(:one)
    user.update!(spotify_id: auth_hash.info.id)

    assert_difference "User.count", 0 do
      SpotifyAuth.new.signin_or_signup_user(auth_hash)
    end
    assert_equal "Test User", user.reload.name
  end

  test "#signin_or_signup_user enqueues CreatePlaylistJob" do
    auth_hash = OmniAuth.config.mock_auth[:spotify]

    SpotifyAuth.new.signin_or_signup_user(auth_hash)

    user = User.find_by(spotify_id: auth_hash.info.id)
    assert_enqueued_with(job: CreatePlaylistJob, args: [user, MoodPlaylist.to_s])
  end
end
