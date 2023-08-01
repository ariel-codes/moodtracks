class AuthenticatedController < ApplicationController
  layout -> { AuthenticatedLayout }

  before_action :require_user!

  helper_method :current_user

  private

  def require_user!
    redirect_to root_path unless signed_in?
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    return if session[:user_id].blank?

    (@current_user ||= User.find_by(id: session[:user_id])) ||
      session.delete(:user_id)
  end
end
