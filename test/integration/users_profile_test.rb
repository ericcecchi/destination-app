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
    assert_select 'div.pagination'
    @user.recommendations.paginate(page: 1).each do |recommendation|
      assert_match recommendation.content, response.body
    end
    assert_select '[aria-label=Pagination]', count: 1
  end
end