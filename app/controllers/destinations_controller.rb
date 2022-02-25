# frozen_string_literal: true

# The controller to manage the Locales and destinations
class DestinationsController < ApplicationController
  def index
    @destinations = Destination.order('name').paginate(page: params[:page], per_page: 33)
  end

  def show
    @destination = Destination.find(params[:id])
    @guides      = @destination.guides.paginate(page: params[:page], per_page: 33)
  end
end
