# frozen_string_literal: true

# Controller for static pages
class StaticPagesController < ApplicationController
  def home
    @locales = Locale.order('name').first(8)
  end

  def about; end
end
