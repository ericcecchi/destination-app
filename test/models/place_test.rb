# frozen_string_literal: true

# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  locale_id  :integer          not null
#  place_id   :string
#
# Indexes
#
#  index_places_on_locale_id  (locale_id)
#
# Foreign Keys
#
#  locale_id  (locale_id => locales.id)
#
require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
