require "rspotify/oauth"

spotify_credentials = Rails.application.credentials.spotify
spotify_scopes = "user-read-email user-read-private playlist-read-private playlist-modify-private ugc-image-upload"

RSpotify.authenticate(spotify_credentials.client_id!, spotify_credentials.client_secret!)

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, spotify_credentials.client_id!, spotify_credentials.client_secret!, scope: spotify_scopes
end
OmniAuth.config.allowed_request_methods = [:post, :get]
OmniAuth.config.silence_get_warning = true
