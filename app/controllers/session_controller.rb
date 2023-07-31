class SessionController < ApplicationController
  include Authenticatable

  def spotify
    spotify_user = RSpotify::User.new(request.env["omniauth.auth"])
    result = SpotifyAuth.new.signin_or_signup_user(spotify_user)
    set_user_session(result.user)
    redirect_to home_path
  end
end
