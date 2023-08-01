# frozen_string_literal: true

class ApplicationComponent < Phlex::HTML
  include Phlex::Rails::Helpers::Routes
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::ButtonTo
  include Phlex::Rails::Helpers::ImageTag
  include InlineSvg::ActionView::Helpers

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  private

  # This is a layout workaround for the extra <form> tag generated by button_to
  def button_to(*args, **kargs, &block)
    super(*args, form_class: "contents", **kargs, &block)
  end
end
