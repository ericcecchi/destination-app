# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:orange)
    @user = users(:michael)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    assert_no_changes '@post.content' do
      patch post_path(@post), params: { post: { content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end

  test 'should create post' do
    log_in_as @user
    assert_difference('Post.count') do
      post posts_url, params: { post: { content: 'Blarg', user_id: @user.id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    log_in_as @user
    patch post_url(@post), params: { post: {content: 'Blerg'} }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    log_in_as @user
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
