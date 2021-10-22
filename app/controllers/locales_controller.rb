# frozen_string_literal: true

# The controller to manage the Locales and cities
class LocalesController < ApplicationController
  def index
    @locales = Locale.order('name').paginate(page: params[:page], per_page: 35)
  end
end
