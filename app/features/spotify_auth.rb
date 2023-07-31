# frozen_string_literal: true

class SpotifyAuth
  def signin_or_signup_user(auth_hash)
    initialize_spotify_user(auth_hash)

    User.transaction do
      @user = User.find_or_initialize_by(spotify_id: spotify_user.id)
      update_user(spotify_user.display_name, spotify_user.email,
        spotify_user.country, spotify_user.images.first&.url)
      update_credential(spotify_user.credentials)
    end

    create_playlists

    Result.new(user)
  end

  class Result
    attr_reader :user

    def initialize(user)
      @user = user
    end
  end

  private

  attr_reader :user, :spotify_user

  def initialize_spotify_user(auth_hash)
    @spotify_user = RSpotify::User.new(auth_hash)
  end

  def update_user(name, email, country, profile_picture)
    user.update!(name:, email:, country:, profile_picture:)
  end

  def update_credential(credentials)
    user_cred = Credential.find_or_initialize_by(user:)
    user_cred.update!(
      token: credentials.token,
      refresh_token: credentials.refresh_token,
      expires_at: Time.at(credentials.expires_at).utc
    )
  end

  def create_playlists
    return if user.playlists.exists?(feature: MoodPlaylist.to_s)

    CreatePlaylistJob.perform_later(user, MoodPlaylist.to_s)
  end
end
