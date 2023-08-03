# frozen_string_literal: true

class TrackSearchComponent < ApplicationComponent
  def template
    div(class: "content", data_controller: "track-search") do
      button(data_action: "click->track-search#open", class: "button-primary py-1 px-3 flex gap-2 items-center") do
        span(class: "inline text-xl small-caps font-black") { "I feel like..." }
        inline_svg_tag("shuffle_icon.svg", class: "w-9 h-9")
      end
      search_modal
    end
  end

  private

  def search_modal
    dialog(data_track_search_target: "modal", class: "w-full" \
      " max-w-[min(calc(100vw_-_theme(spacing.4)),_60ch)] overflow-visible mx-auto glassy backdrop:bg-gray-800/50 rounded-lg p-4") do
      form_with url: search_tracks_path, method: :put do |f|
        f.label :query, class: "relative block" do
          f.search_field :query, placeholder: "Choose a song for this moment...", autofocus: true, required: true,
            class: "rounded-md pr-8 w-full py-2 text-lg font-bold text-slate-800 " \
              " placeholder:italic placeholder:text-brand-600 bg-slate-50/75 placeholder-brand-100" \
              " focus:ring-brand-500 focus:border-brand-500"
          span class: "absolute inset-y-0 right-0 flex items-center pr-1 text-brand-600" do
            inline_svg_tag "ui/search.svg", class: "h-8 w-8"
          end
        end
      end
      form method: "dialog" do
        button type: "submit", class: "absolute flex top-0 right-0 -mt-3 -mr-3 rounded-full" \
          " -m-1 text-gray-50/50 backdrop-blur-sm bg-clip-content" do
          inline_svg_tag "ui/close.svg", class: "h-8 w-8"
        end
      end
      turbo_frame_tag "track-search-results"
    end
  end
end
