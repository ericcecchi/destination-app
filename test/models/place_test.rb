# frozen_string_literal: true

# == Schema Information
#
# Table name: places
#
#  id                :bigint           not null, primary key
#  details           :jsonb
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  external_place_id :string
#  locale_id         :integer
#
# Indexes
#
#  index_places_on_external_place_id  (external_place_id) UNIQUE
#  index_places_on_locale_id          (locale_id)
#
# Foreign Keys
#
#  fk_rails_...  (locale_id => locales.id)
#
require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
