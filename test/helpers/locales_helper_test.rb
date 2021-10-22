# frozen_string_literal: true

require 'test_helper'

class LocalesHelperTest < ActionView::TestCase
  test 'local_url should return a local path for local files' do
    assert_equal '/assets/images/lorem.jpeg', local_url('lorem.jpeg')
  end

  test 'local_url should return the http url when it is a valid url' do
    assert_equal 'https://hello.world', local_url('https://hello.world')
    assert_equal 'http://hello.world', local_url('http://hello.world')
    assert_equal '//hello.world', local_url('//hello.world')
  end
end
