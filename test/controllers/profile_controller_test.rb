require "test_helper"
require "controller_helpers"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  requires_sign_in(:get) { home_url }

  def setup
    @user = users(:one)
  end

  test "should get index" do
    sign_in_as @user
    get profile_url
    assert_response :success
    assert_select "h1", @user.name
  end

  test "DELETE should delete user account" do
    sign_in_as users(:one)

    assert_difference "User.count", -1 do
      delete profile_url
    end
    follow_redirect!
    assert_equal "Your account has been deleted.", flash[:notice]
  end
end
