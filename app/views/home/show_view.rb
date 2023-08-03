# frozen_string_literal: true

class Home::ShowView < ApplicationView
  def initialize(user_tracks)
    @user_tracks = user_tracks.order(:created_at)
  end

  def template
    div class: "glass card mt-4 p-2" do
      h1(class: "text-3xl font-bold italic text-center") { "MoodTracks" }
    end
    return unless @user_tracks.any?
    div class: "glass card mt-2 p-2 flex flex-col" do
      @user_tracks.group_by_year(&:created_at).each do |year, user_tracks|
        h2(class: "text-2xl text-slate-400") { year.strftime("%Y") }
        div class: "flex flex-col pl-2 border-l border-slate-400" do
          user_tracks.group_by_month(&:created_at).each do |month, user_tracks|
            h3(class: "text-xl text-slate-300") { month.strftime("%B") }
            div class: "flex flex-col pl-2 border-l border-slate-300" do
              user_tracks.group_by_day(&:created_at).each do |day, user_tracks|
                h4(class: "text-lg") { day.strftime("%A, %B %-d") }
                div class: "flex flex-col pl-2 border-l border-slate-200" do
                  user_tracks.each do |user_track|
                    track_card user_track.track
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  private

  def track_card(track)
    div class: "flex gap-2 items-center p-2 bg-slate-800/50 rounded-sm" do
      image_tag track.thumbnail_url, class: "w-10 h-10"
      div(class: "flex flex-col text-start flex-grow") do
        p(class: "text-slate-200 truncate") { track.name }
        p(class: "text-slate-400 text-sm leading-tight truncate") { track.artist }
      end
      valence_5 = (1 - track.valence) / 2.0 * 5.0
      # for Tailwind
      valence_color = case valence_5
      when 0..1
        "bg-red-400"
      when 1..2
        "bg-yellow-400"
      when 2..3
        "bg-green-400"
      when 3..4
        "bg-blue-400"
      when 4..5
        "bg-purple-400"
      end
      p(class: "rounded-full text-bold text-white p-2 #{valence_color}") { valence_5 }
    end
  end
end
