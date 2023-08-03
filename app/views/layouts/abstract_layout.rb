class AbstractLayout < ApplicationView
  include Phlex::Rails::Layout
  register_element :canvas

  private

  def headers
    head do
      title { "MoodTracks" }
      meta(name: "description", content: "track your mood through the magic of music")

      meta(name: "viewport", content: "width=device-width,initial-scale=1")
      csrf_meta_tags
      csp_meta_tag

      stylesheets
      google_fonts
      favicons
      javascripts
      webmanifest
    end
  end

  def stylesheets
    stylesheet_link_tag "tailwind", "data-turbo-track": "reload"
    stylesheet_link_tag "application", "data-turbo-track": "reload"
  end

  def javascripts
    javascript_importmap_tags
  end

  def favicons
    link(rel: "icon", href: "/favicon.ico", sizes: "any")
    link(rel: "icon", href: "/favicon.svg", type: "image/svg+xml")
    link(rel: "apple-touch-icon", href: "/apple-touch-icon.png")
  end

  def google_fonts
    stylesheet_link_tag "https://fonts.googleapis.com", rel: "preconnect"
    stylesheet_link_tag "https://fonts.gstatic.com", rel: "preconnect", crossorigin: true
    stylesheet_link_tag "https://fonts.googleapis.com/css?family=Audiowide&text=MoodTracks"
  end

  def webmanifest
    link(rel: "manifest", href: "/site.webmanifest")
    meta(name: "theme-color", content: "#41bb2c")
  end
end
