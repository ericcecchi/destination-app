# frozen_string_literal: true

# The controller to manage the Locales and cities
class LocalesController < ApplicationController
  def index
    @locales = Locale.order('name').paginate(page: params[:page], per_page: 35)
  end

  def show
    @locale = Locale.find(params[:id])
    @guides = @locale.guides.paginate(page: params[:page], per_page: 35)
  end
end
