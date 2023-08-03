require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should create a new User" do
    OmniAuth.config.add_mock(:spotify, {
      provider: "spotify",
      info: {
        id: "123456789",
        display_name: "Test User",
        email: "test@example.com",
        country: "US",
        images: [
          {url: "https://example.com/test.jpg"}
        ]
      },
      credentials: {
        token: "123456789",
        refresh_token: "123456789",
        expires_at: (Time.now.utc + 1.hour).to_i
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]

    assert_difference "User.count", 1 do
      get auth_spotify_callback_url
    end
    assert_equal User.last.id, session[:user_id]
  end

  test "should update an existing User" do
    user = users(:one)
    OmniAuth.config.add_mock(:spotify, {
      provider: "spotify",
      info: {
        id: user.spotify_id,
        display_name: "Test User",
        email: "test@example.com",
        country: "US",
        images: [
          {url: "https://example.com/test.jpg"}
        ]
      },
      credentials: {
        token: "123456789",
        refresh_token: "123456789",
        expires_at: (Time.now.utc + 1.hour).to_i
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]

    assert_no_difference "User.count" do
      get auth_spotify_callback_url
    end
    assert_equal "Test User", user.reload.name
  end
end
