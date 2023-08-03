# frozen_string_literal: true

class AuthenticatedLayout < AbstractLayout
  def template(&content)
    doctype
    html(lang: "en") do
      headers
      body(class: "flex h-screen w-screen bg-neutral-950 px-2 md:pt-1") do
        # TODO: make this a component, and react to the user's mood
        # eg. if the user is selects energetic music, gaussian deviation is higher
        canvas data_controller: "ridgeline-plot", data_turbo_permanent: true, id: "ridgeline-plot",
          class: "absolute top-0 left-0 w-full h-full bg-black blur-sm -z-50"
        div(class: "mx-auto max-w-3xl flex-grow flex flex-col-reverse md:flex-col") do
          action_bar
          main(class: "flex-grow flex flex-col", &content)
        end
      end
    end
  end

  private

  def google_fonts
    # noop
  end

  def action_bar
    header(class: "card absolute inset-x-0 bottom-0 z-index-50 mx-2 mb-2 py-3 self-stretch flex justify-evenly text-brand-100") do
      button(class: "button-primary py-1 px-3 flex gap-2 items-center") do
        span(class: "inline text-xl small-caps font-black") { "I feel like" }
        inline_svg_tag("shuffle_icon.svg", class: "w-9 h-9")
      end
      nav class: "contents text-lg" do
        nav_link(nav_icon("home"), home_path)
        nav_link(nav_icon("graphs"), "/graphs")
        nav_link(nav_icon("profile"), profile_path)
      end
    end
  end

  def current_user
    helpers.current_user
  end

  def nav_link(label, path)
    classes = "button w-11 h-11 flex justify-center items-center"
    link_to_unless_current label, path, class: classes do
      button(class: classes, disabled: true) { label }
    end
  end

  def nav_icon(icon)
    raw_inline_svg_tag "ui/#{icon}.svg", class: "w-8"
  end
end
