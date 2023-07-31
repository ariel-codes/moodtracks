ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

OmniAuth.config.test_mode = true

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def initialize(...)
      super(...)
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
    end
  end
end
