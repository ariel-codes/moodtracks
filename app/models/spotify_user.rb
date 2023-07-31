# frozen_string_literal: true

class SpotifyUser < RSpotify::User
  attr_reader :local_user

  def initialize(local_user)
    @local_user = local_user
    credentials = local_user.credential

    callback_proc = proc { |new_token, token_lifetime|
      deadline = Time.now.utc.to_i + token_lifetime
      credentials.update!(token: new_token, expires_at: Time.at(deadline).utc)
    }

    super({
      "credentials" => {
        "token" => credentials.token,
        "refresh_token" => credentials.refresh_token,
        "access_refresh_callback" => callback_proc
      },
      "id" => local_user.spotify_id
    })
  end
end
