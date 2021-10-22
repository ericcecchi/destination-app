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
#  place_id   :integer
#  user_id    :integer          not null
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
require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @recommendation = @user.recommendations.build(title: 'Title', content: 'Lorem ipsum')
  end

  test 'should be valid' do
    assert @recommendation.valid?
  end

  test 'user id should be present' do
    @recommendation.user_id = nil
    assert_not @recommendation.valid?
  end

  test 'content should be present' do
    @recommendation.content = '   '
    assert_not @recommendation.valid?
  end

  test 'order should be most recent first' do
    assert_equal recommendations(:most_recent), Recommendation.first
  end
end
