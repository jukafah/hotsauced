module ApplicationHelper

    def is_active?(path)

        return 'nav-link active' if current_page?(path) else 'nav-link'
    end

    def page_title
      'HOT SAUCED'
    end
end
