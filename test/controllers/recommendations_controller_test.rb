# frozen_string_literal: true

require 'test_helper'

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recommendation = recommendations(:orange)
    @user = users(:michael)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Recommendation.count' do
      post recommendations_path, params: { recommendation: { content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    assert_no_changes '@recommendation.content' do
      patch recommendation_path(@recommendation), params: { recommendation: { content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Recommendation.count' do
      delete recommendation_path(@recommendation)
    end
    assert_redirected_to login_url
  end

  test 'should create recommendation' do
    log_in_as @user
    assert_difference('Recommendation.count') do
      post recommendations_url, params: { recommendation: { content: 'Blarg', user_id: @user.id } }
    end

    assert_redirected_to @user
  end

  test 'should show recommendation' do
    get recommendation_url(@recommendation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recommendation_url(@recommendation)
    assert_response :success
  end

  test 'should update recommendation' do
    log_in_as @user
    patch recommendation_url(@recommendation), params: { recommendation: { content: 'Blerg' } }
    assert_redirected_to @user
  end

  test 'should destroy recommendation' do
    log_in_as @user
    assert_difference('Recommendation.count', -1) do
      delete recommendation_url(@recommendation)
    end

    assert_redirected_to @user
  end
end
