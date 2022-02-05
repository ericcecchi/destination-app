# frozen_string_literal: true

# == Schema Information
#
# Table name: places
#
#  id                :bigint           not null, primary key
#  content           :text
#  details           :jsonb
#  image_url         :string
#  name              :string
#  type              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  external_place_id :string
#  parent_id         :integer
#
# Indexes
#
#  index_places_on_external_place_id  (external_place_id) UNIQUE
#
class Place < ApplicationRecord
  has_many :recommendations, dependent: :nullify

  DETAILS_KEYS = %i[formatted_address geometry name place_id website].freeze
  store_accessor :details, DETAILS_KEYS, prefix: true

  acts_as_tree
end
