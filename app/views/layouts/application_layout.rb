# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&content)
    doctype

    html(lang: "en") do
      head do
        title { "MoodTracks" }
        meta(name: "description", content: "track your mood through the magic of music")

        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        csrf_meta_tags
        csp_meta_tag

        stylesheet_link_tag "tailwind", "data-turbo-track": "reload"
        stylesheet_link_tag "application", "data-turbo-track": "reload"
        javascript_importmap_tags

        link(rel: "preconnect", href: "https://fonts.googleapis.com")
        link(rel: "preconnect", href: "https://fonts.gstatic.com", crossorigin: true)
        link(rel: "stylesheet", href: "https://fonts.googleapis.com/css?family=Rubik")

        link(rel: "icon", href: "/favicon.ico", sizes: "any")
        link(rel: "icon", href: "/favicon.svg", type: "image/svg+xml")
        link(rel: "apple-touch-icon", href: "/apple-touch-icon.png")

        link(rel: "manifest", href: "/site.webmanifest")
        meta(name: "theme-color", content: "#41bb2c")
      end
      body(class: "flex flex-col h-screen w-screen bg-brand-50 items-center") do
        header(class: "p-4 bg-brand-600 text-white text-xl self-stretch flex justify-center") do
          div(class: "container") do
            div(class: "flex gap-1 font-bold uppercase") do
              span { "Mood" }
              image_tag "shuffle_icon.svg", size: 24
              span { "Tracks" }
            end
          end
        end
        main(class: "flex-grow container px-4", &content)
      end
    end
  end
end
