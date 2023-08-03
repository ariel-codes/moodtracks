# frozen_string_literal: true

class Landing::IndexView < ApplicationView
  def template
    div(class: "mt-8 flex flex-col gap-6") do
      div(class: "card flex flex-col gap-4 p-3 md:p-6") do
        h1(class: "font-bold text-2xl") do
          "Track your mood through the power of music!"
        end
        p(class: "text-xl") do
          <<~TEXT
            Now you can express your feelings using your favorite songs:
            search for your current earworm and MoodTracks will calculate its mood for you.
          TEXT
        end
        link_to "Sign in with Spotify", "/auth/spotify", method: :post,
          class: "border-t border-x border-t-brand-400 border-brand-500 text-lg " \
            "text-white text-center font-black uppercase px-4 py-2 bg-brand-600 rounded-md shadow-sm " \
            "hover:bg-brand-500 border-t-brand-300 hover:border-brand-400 hover:shadow-md hover:scale-105 " \
            "active:bg-brand-700 active:border-brand-700 active:shadow-lg active:scale-100"
      end
    end
  end
end
