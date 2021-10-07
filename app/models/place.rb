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
class Place < ApplicationRecord
  belongs_to :locale, optional: true
  has_many :recommendations, dependent: :nullify

  DETAILS_KEYS = %i[formatted_address geometry name place_id website].freeze
  store_accessor :details, DETAILS_KEYS, prefix: true
end
