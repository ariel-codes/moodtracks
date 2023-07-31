class LandingController < ApplicationController
  def index
    render Landing::IndexView
  end
end
