# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    return 'nav-link active' if request.fullpath.start_with?(path) else 'nav-link'
  end

  def page_title
    'HOT SAUCED'
  end
end
