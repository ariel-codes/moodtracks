class SessionController < ApplicationController
  redirect_to_home_if_signed_in except: :destroy

  def create
    result = SpotifyAuth.new.signin_or_signup_user(request.env["omniauth.auth"])
    set_user_session(result.user)
    redirect_to home_path
  end

  def destroy
    unset_user_session
    redirect_to root_path, status: :see_other
  end

  private

  def set_user_session(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def unset_user_session
    @current_user = nil
    session.delete(:user_id)
  end
end
