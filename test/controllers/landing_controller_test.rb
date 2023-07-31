require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get index at root" do
    get root_url
    assert_response :success
  end

  test "should be root path" do
    assert_generates "/", controller: "landing", action: "index"
  end
end
