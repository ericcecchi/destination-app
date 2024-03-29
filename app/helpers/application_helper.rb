# frozen_string_literal: true

# App-wide helper methods
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Destination'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def flash_styles(message_type)
    # rubocop:disable Style/HashLikeCase
    case message_type.to_sym
    when :info
      'border-2 border-blue-500 dark:border-blue-800 bg-blue-200 dark:bg-blue-600 bg-opacity-50 dark:bg-opacity-10'
    when :success
      'border-2 border-green-500 dark:border-green-800 bg-green-200 dark:bg-green-600 bg-opacity-50 dark:bg-opacity-10'
    when :danger
      'border-2 border-red-500 dark:border-red-900 bg-red-200 dark:bg-red-600 bg-opacity-50 dark:bg-opacity-10'
    end
    # rubocop:enable Style/HashLikeCase
  end
end
