module ApplicationHelper
  def active(path)
    'active' if current_page?(path)
  end

  def link_to_path(path)
    "href=#{path}" if session[:property_found]
  end

  def disabled_class(path)
    'is-disabled' unless link_to_path(path)
  end
end