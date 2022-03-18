# frozen_string_literal: true

require 'test_helper'

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recommendation = recommendations(:orange)
    @place = places(:one)
    @user = users(:michael)
  end

  test 'new should render select when no place provided' do
    log_in_as @user
    get new_recommendation_path
    assert_select 'select[data-controller=datalist]', 1
  end

  test 'new should render place card with place' do
    log_in_as @user
    get new_recommendation_path(place: @place)
    assert_select 'div.place', 1
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
      post recommendations_url, params: { recommendation: { title: 'Title', content: 'Blarg', place_id: @place.id } }
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
    patch recommendation_url(@recommendation), params: { recommendation: { title: 'Title', content: 'Blerg' } }
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
