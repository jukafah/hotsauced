# frozen_string_literal: true

module ApplicationHelper
  def active?(path)
    return 'nav-link active' if request.fullpath.start_with?(path) else 'nav-link'
  end

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}"
    return File.read(file_path).html_safe if File.exist?(file_path)
    '(not found)'
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def page_title
    'HOT SAUCED'
  end
end
