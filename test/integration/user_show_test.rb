# frozen_string_literal: true

require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @inactive_user  = users(:inactive)
    @activated_user = users(:archer)
    @other_activated_user = users(:michael)
  end

  test 'should redirect when viewing a user not activated' do
    log_in_as @activated_user
    get user_path(@inactive_user)
    assert_response      :found
    assert_redirected_to root_url
  end

  test 'should show own profile if current user not activated' do
    log_in_as @inactive_user
    get user_path(@inactive_user)
    assert_response :success
    assert_template 'users/show'
  end

  test 'should redirect when viewing another profile if current user not activated' do
    log_in_as @inactive_user
    get user_path(@activated_user)
    assert_response      :found
    assert_redirected_to root_url
  end

  test 'should display other users when activated' do
    log_in_as @activated_user
    get user_path(@other_activated_user)
    assert_response :success
    assert_template 'users/show'
  end
end
