# frozen_string_literal: true

module Locales
  # Interaction to create a locale
  class Create < ApplicationInteraction
    hash :params do
      string :name
      string :content
      string :image_url
    end
    string :external_place_id, default: nil

    attr_reader :locale

    def execute
      create_locale if external_place_id.present?
      update_locale
      locale
    end

    def create_locale
      @locale = compose(
        Places::CreateByPlaceId,
        external_place_id: external_place_id,
        type: 'Locale'
      )
    end

    def update_locale
      @locale.update!(params)
    end
  end
end
