# frozen_string_literal: true

module Services
  module Google
    module Places
      # Fetches Place Details from the Places API
      class Details < PlacesInteraction
        string :place_id

        def execute
          send_request
        end

        def send_request
          client.spot(place_id)
        end
      end
    end
  end
end
