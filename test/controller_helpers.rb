module SignInHelper
  def sign_in_as(user)
    OmniAuth.config.add_mock(:spotify, {
      provider: "spotify",
      info: {
        id: user.spotify_id,
        display_name: user.name,
        email: user.email,
        country: user.country,
        images: [
          {url: user.profile_picture}
        ]
      },
      credentials: {
        token: user.credential.token,
        refresh_token: user.credential.refresh_token,
        expires_at: user.credential.expires_at.to_i
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:spotify]

    get auth_spotify_callback_url

    Rails.application.env_config["omniauth.auth"] = nil
  end

  def self.included(base)
    base.class_eval do
      def self.requires_sign_in(verb, &path)
        test "requires sign in" do
          send(verb, instance_eval(&path))
          assert_redirected_to root_url
        end
      end
    end
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
