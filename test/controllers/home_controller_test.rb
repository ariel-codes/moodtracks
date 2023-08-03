require "test_helper"
require "controller_helpers"

class HomeControllerTest < ActionDispatch::IntegrationTest
  requires_sign_in(:get) { home_url }

  test "should get index" do
    sign_in_as users(:one)
    get home_url
    assert_response :success
  end
end
