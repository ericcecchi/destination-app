# frozen_string_literal: true

# == Schema Information
#
# Table name: guide_recommendations
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  guide_id          :bigint           not null
#  recommendation_id :bigint           not null
#
# Indexes
#
#  index_guide_recommendations_on_guide_id           (guide_id)
#  index_guide_recommendations_on_recommendation_id  (recommendation_id)
#
# Foreign Keys
#
#  fk_rails_...  (guide_id => guides.id)
#  fk_rails_...  (recommendation_id => recommendations.id)
#
class GuideRecommendation < ApplicationRecord
  belongs_to :guide
  belongs_to :recommendation
  validates :guide_id, presence: true
  validates :recommendation_id, presence: true
end
