class PublicLayout < AbstractLayout
  def template(&content)
    doctype
    html(lang: "en") do
      headers
      body(class: "flex h-screen w-screen bg-neutral-950 px-2 pt-1") do
        canvas data_controller: "ridgeline-plot", data_turbo_permanent: true, id: "ridgeline-plot",
          class: "absolute top-0 left-0 w-full h-full bg-black blur-[1px] -z-50"
        div(class: "mx-auto max-w-3xl flex-grow flex flex-col") do
          app_header
          main(class: "flex-grow flex flex-col", &content)
        end
      end
    end
  end

  private

  def app_header
    header(class: "card justify-center flex gap-1 p-2 md:p-4") do
      logotype
    end
  end

  def logotype
    link_to(home_path, class: "flex gap-2 items-center font-display font-bold italic text-white text-4xl") do
      span { "Mood" }
      inline_svg_tag "shuffle_icon.svg", size: "1.25em", class: "text-brand-600"
      span { "Tracks" }
    end
  end
end
