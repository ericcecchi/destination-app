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
require "test_helper"

class GuideRecommendationTest < ActiveSupport::TestCase

  def setup
    @gr = guide_recommendations(:one)
  end

  test 'should be valid' do
    assert @gr.valid?
  end

  test 'should require a guide_id' do
    @gr.guide_id = nil
    assert_not @gr.valid?
  end

  test 'should require a recommendation_id' do
    @gr.recommendation_id = nil
    assert_not @gr.valid?
  end
end
