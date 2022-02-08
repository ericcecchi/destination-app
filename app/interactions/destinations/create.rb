# frozen_string_literal: true

module Destinations
  # Interaction to create a destination
  class Create < ApplicationInteraction
    hash :params do
      string :name
      string :content
      string :image_url
    end
    string :external_place_id, default: nil

    attr_reader :destination

    def execute
      create_destination if external_place_id.present?
      update_destination
      destination
    end

    def create_destination
      @destination = compose(
        Places::CreateByPlaceId,
        external_place_id: external_place_id,
        type: 'Destination'
      )
    end

    def update_destination
      @destination.update!(params)
    end
  end
end
