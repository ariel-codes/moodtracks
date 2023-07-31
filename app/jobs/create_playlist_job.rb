class CreatePlaylistJob < ApplicationJob
  queue_as :default

  def perform(user, feature)
    playlist = feature.constantize.new(user)
    playlist.create_if_not_exists!
  end
end
