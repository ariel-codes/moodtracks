class SessionController < ApplicationController
  include Authenticatable

  def spotify
    result = SpotifyAuth.new.signin_or_signup_user(request.env["omniauth.auth"])
    set_user_session(result.user)
    redirect_to home_path
  end
end
