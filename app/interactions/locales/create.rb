# frozen_string_literal: true

module Locales
  # Interaction to create a locale
  class Create < ApplicationInteraction
    hash :params do
      string :name
      string :content
      string :hero_image_url
    end
    string :external_place_id, default: nil

    attr_reader :place, :locale

    def execute
      create_place if external_place_id.present?
      create_locale
      add_locale_to_place if place
      locale
    end

    def create_place
      @place = compose(
        Places::CreateByPlaceId,
        external_place_id: external_place_id
      )
    end

    def create_locale
      @locale = Locale.create!(params.merge({ place: place }))
    end

    def add_locale_to_place
      place.locale = locale
      place.save!
    end
  end
end
