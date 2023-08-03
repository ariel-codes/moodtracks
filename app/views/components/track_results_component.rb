# frozen_string_literal: true

class TrackResultsComponent < ApplicationComponent
  def initialize(tracks)
    @tracks = tracks
  end

  def template
    turbo_frame_tag "track-search-results", class: "contents" do
      ul(class: "flex flex-col mt-4 rounded overflow-hidden") do
        @tracks.each do |track|
          li(class: "contents") do
            button_to tracks_path, params: {track: track.to_h}, method: :post, data_turbo: false,
              class: "flex gap-2 items-center p-2 bg-slate-900/75 hover:bg-slate-700/75" do
              image_tag track.thumbnail_url, class: "w-10 h-10"
              div(class: "flex flex-col text-start") do
                p(class: "text-slate-200 truncate") { track.name }
                p(class: "text-slate-400 text-sm leading-tight truncate") { track.artist }
              end
            end
          end
        end
      end
    end
  end
end
