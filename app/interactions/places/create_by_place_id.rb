# frozen_string_literal: true

module Places
  # Interaction for creating a place given a Google Places place_id
  class CreateByPlaceId < ApplicationInteraction
    string :external_place_id
    string :type

    def execute
      add_place_details unless place.details
      place
    end

    def spot
      @spot ||= compose(
        Services::Google::Places::Details,
        place_id: external_place_id
      )
    end

    def place
      @place ||= Place.create_or_find_by(
        external_place_id: external_place_id,
        type: type
      )
    end

    def add_place_details
      place.update!(
        name: spot.name,
        details: spot.as_json
      )
    end
  end
end
