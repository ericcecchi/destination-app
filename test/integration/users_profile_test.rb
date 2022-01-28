# frozen_string_literal: true

require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test 'profile display' do
    log_in_as @user
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'img.gravatar'
    assert_match @user.recommendations.count.to_s, response.body
    assert_select 'div#guides'
    assert_select 'div#recommendations'
    @user.guides.limit(5).each do |guide|
      assert_match guide.description, response.body
    end
    @user.recommendations.limit(5).each do |recommendation|
      assert_match recommendation.content, response.body
    end
  end
end
