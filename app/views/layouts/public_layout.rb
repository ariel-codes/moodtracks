class PublicLayout < AbstractLayout
  def template(&content)
    doctype
    html(lang: "en") do
      headers
      body(class: "flex h-screen w-screen bg-neutral-950 px-2 pt-1") do
        div data_controller: "ridgeline-plot",
          class: "absolute top-0 left-0 w-full h-full bg-brand-950/5 -z-5 bg-clip-padding backdrop-filter backdrop-blur-[1px]"
        div(class: "mx-auto max-w-3xl flex-grow flex flex-col") do
          app_header
          main(class: "flex-grow flex flex-col", &content)
        end
      end
    end
  end

  private

  def app_header
    header(class: "glassy rounded p-4 mt-2 justify-center flex gap-1") do
      logotype
    end
  end
end
