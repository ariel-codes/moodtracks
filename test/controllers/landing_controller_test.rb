require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get index at root" do
    get root_url
    assert_generates "/", controller: "landing", action: "index"
    assert_response :success
  end
end
