class ApplicationController < ActionController::Base
  layout -> { ApplicationLayout }

  def self.redirect_to_home_if_signed_in(**options)
    before_action(**options) do
      redirect_to home_path, status: :see_other if session[:user_id].present?
    end
  end
end
