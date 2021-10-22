# frozen_string_literal: true

require 'test_helper'

class LocalesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get cities_url
    assert_response :success
    assert_equal('/cities', cities_path)
  end

  test 'list has all of the needed features' do
    get cities_url
    assert_select 'ul li[data-list="cities"]', max: 35, min: 1 do |els| # 35 `li`s
      els.each_with_index do |el, i|
        id = el.xpath('//li/@id').to_s.scan(/\d+/)[i]
        instance = Locale.find(id)
        # TODO: assert_select el, "a[href=?]", locale_path(instance.id)
        # Need to create individual guide list pages in method `show` first. ex: /cities/1
        assert_select el, 'a'
        assert_select el, 'a h2', text: instance.name # title
        assert_select el, 'img[src=?]', "/assets/images/#{instance.hero_image_url}", 1 # cover
        assert_select el, 'p', text: instance.content # description
      end
    end
  end

  test 'list is in alphabetical order' do
    get cities_url
    assert_select 'ul li[data-list="cities"] a h2', max: 35 do |els|
      vals = els.to_a.map do |el|
        el.css('h2').text.to_s
      end
      assert_equal vals, vals.sort
    end
  end
end
