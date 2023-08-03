# frozen_string_literal: true

class HomesController < AuthenticatedController
  def show
    render Home::ShowView.new
  end
end
