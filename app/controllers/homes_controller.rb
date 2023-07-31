# frozen_string_literal: true

class HomesController < ApplicationController
  def show
    render Home::ShowView
  end
end
