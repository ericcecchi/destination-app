# frozen_string_literal: true

# == Schema Information
#
# Table name: locales
#
#  id             :bigint           not null, primary key
#  content        :string
#  hero_image_url :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  place_id       :bigint           not null
#
# Indexes
#
#  index_locales_on_place_id  (place_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#
class Locale < ApplicationRecord
  belongs_to :place, optional: false
  has_many :places, dependent: :nullify
end
