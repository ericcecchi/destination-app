# frozen_string_literal: true

# Resource controller for recommendations
class RecommendationsController < ApplicationController
  before_action :logged_in_user, only: %i[create update destroy]
  before_action :set_recommendation, only: %i[show edit update destroy]

  # GET /recommendations/1
  def show; end

  # GET /recommendations/1/edit
  def edit
    @place = @recommendation.place
  end

  # POST /recommendations
  def create
    @recommendation = current_user.recommendations.build(recommendation_params)

    if @recommendation.save
      redirect_to current_user, notice: 'Recommendation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /recommendations/new
  def new
    @place = Place.exists?(id: params[:place]) ? Place.find(params[:place]) : Place.new
    @recommendation = Recommendation.new
  end

  # PATCH/PUT /recommendations/1
  def update
    if @recommendation.update(recommendation_params)
      redirect_to current_user, notice: 'Recommendation was successfully updated.'
    else
      render current_user
    end
  end

  # DELETE /recommendations/1
  def destroy
    @recommendation.destroy
    redirect_to current_user, notice: 'Recommendation was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recommendation_params
    params.require(:recommendation).permit(:content, :title, :place_id)
  end
end
