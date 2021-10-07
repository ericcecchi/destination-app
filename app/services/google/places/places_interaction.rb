# frozen_string_literal: true

module Services
  module Google
    module Places
      # Base class for Google Places API interactions
      class PlacesInteraction < ActiveInteraction::Base
        def client
          @client ||= GooglePlaces::Client.new(ENV['GOOGLE_PLACES_API_KEY'])
        end
      end
    end
  end
end
