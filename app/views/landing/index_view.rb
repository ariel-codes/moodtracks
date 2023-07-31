# frozen_string_literal: true

class Landing::IndexView < ApplicationView
  def template
    div(class: "mx-auto max-w-lg mt-8 flex flex-col gap-6") do
      div(class: "card flex flex-col gap-4") do
        h1(class: "font-bold text-2xl") do
          "Track your mood through the power of music!"
        end
        p do
          <<~TEXT
            Now you can express your feelings using your favorite songs:
            search for your current earworm and MoodTracks will calculate its mood for you.
          TEXT
        end
      end
      link_to "Sign in with Spotify", "/auth/spotify", method: :post,
        class: "text-white font-bold uppercase px-4 py-2 bg-brand-700 rounded-full shadow-md text-center"
    end
  end
end
