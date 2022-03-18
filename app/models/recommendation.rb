# frozen_string_literal: true

# == Schema Information
#
# Table name: recommendations
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_recommendations_on_place_id                (place_id)
#  index_recommendations_on_user_id                 (user_id)
#  index_recommendations_on_user_id_and_created_at  (user_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#  fk_rails_...  (user_id => users.id)
#
class Recommendation < ApplicationRecord
  belongs_to :user, validate: true
  belongs_to :place, validate: true
  has_many :guide_recommendations, dependent: :destroy
  has_many :guides, through: :guide_recommendations

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
end
