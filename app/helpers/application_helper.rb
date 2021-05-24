# frozen_string_literal: true

module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Tutorial Sample App'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def flash_styles(message_type)
    p message_type.to_sym
    case message_type.to_sym
    when :success
      'bg-green-200 dark:bg-green-800'
    when :danger
      'bg-red-200 dark:bg-red-800'
    end
  end
end
