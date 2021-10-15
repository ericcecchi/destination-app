# frozen_string_literal: true

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
