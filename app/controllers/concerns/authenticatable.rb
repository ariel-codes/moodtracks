# frozen_string_literal: true

module Authenticatable
  extend ActiveSupport::Concern

  attr_reader :current_user

  def set_user_session(user)
    @current_user = user
    session[:user_id] = user.id
  end
end
