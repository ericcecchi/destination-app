# frozen_string_literal: true

# Controller for guides
class GuidesController < ApplicationController
  before_action :logged_in_user, only: %i[create new]

  def new
    @guide = Guide.new
  end

  def create
    @guide = current_user.guides.build(create_params)

    if @guide.save
      redirect_to current_user, notice: 'Guide was successfully created.'
    else
      redirect_to current_user, notice: 'Failed to create guide.'
    end
  end

  def show
    @guide = Guide.find(params[:id])
    @recommendations = @guide.recommendations.paginate(page: params[:page], per_page: 35)
  end

  private

  # Only allow a list of trusted parameters through.
  def create_params
    params.require(:guide).permit(:destination_id, :title, :description)
  end
end
