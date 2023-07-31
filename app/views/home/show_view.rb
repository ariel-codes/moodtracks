# frozen_string_literal: true

class Home::ShowView < ApplicationView
  def template
    h1 { "Home index" }
    p { "Find me in app/views/home/index_view.rb" }
  end
end
