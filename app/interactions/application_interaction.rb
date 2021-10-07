# frozen_string_literal: true

# Base class for all endpoint interactions.
class ApplicationInteraction < ActiveInteraction::Base
  def validate_and_save(resource)
    if resource.valid?
      resource.save
    else
      errors.merge!(resource.errors)
      false
    end
  end
end
