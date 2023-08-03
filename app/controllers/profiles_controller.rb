# frozen_string_literal: true

class ProfilesController < AuthenticatedController
  def show
    render Profile::ShowView.new
  end
end
