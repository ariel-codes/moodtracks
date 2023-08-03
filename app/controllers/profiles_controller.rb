# frozen_string_literal: true

class ProfilesController < AuthenticatedController
  def show
    render Profile::ShowView.new current_user
  end

  def destroy
    current_user.destroy
    redirect_to root_path, notice: "Your account has been deleted.", status: :see_other
  end
end
