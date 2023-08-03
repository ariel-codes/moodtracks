# frozen_string_literal: true

class HomesController < AuthenticatedController
  def show
    render Home::ShowView.new(current_user.user_tracks.includes(:track))
  end
end
