class LandingController < ApplicationController
  redirect_to_home_if_signed_in

  def index
    render Landing::IndexView
  end
end
