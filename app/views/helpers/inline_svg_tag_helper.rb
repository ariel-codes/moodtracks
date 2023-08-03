module InlineSvgTagHelper
  extend Phlex::Rails::HelperMacros

  include InlineSvg::ActionView::Helpers
  alias_method :gem_inline_svg_tag, :inline_svg_tag

  define_output_helper :inline_svg_tag

  def raw_inline_svg_tag(...)
    gem_inline_svg_tag(...)
  end
end
