# frozen_string_literal: true

class SpotifyAuth
  def signin_or_signup_user(spotify_user)
    User.transaction do
      @user = User.find_or_initialize_by(spotify_id: spotify_user.id)
      update_user(spotify_user.display_name, spotify_user.email,
        spotify_user.country, spotify_user.images.first&.url)
      update_credential(spotify_user.credentials)
    end
    Result.new(@user)
  end

  class Result
    attr_reader :user

    def initialize(user)
      @user = user
    end
  end

  private

  def update_user(name, email, country, profile_picture)
    @user.update!(name:, email:, country:, profile_picture:)
  end

  def update_credential(credentials)
    user_cred = Credential.find_or_initialize_by(user: @user)
    user_cred.update!(
      token: credentials.token,
      refresh_token: credentials.refresh_token,
      expires_at: Time.at(credentials.expires_at).utc
    )
  end
end
