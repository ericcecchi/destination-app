# == Schema Information
#
# Table name: guides
#
#  id             :bigint           not null, primary key
#  description    :text
#  image_url      :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  destination_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_guides_on_destination_id  (destination_id)
#  index_guides_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (destination_id => places.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class GuideTest < ActiveSupport::TestCase
  def setup
    @guide = guides(:one)
  end

  test 'guide should be valid' do
    assert @guide.valid?
  end

  test 'guide should require a title' do
    @guide.title = ''
    assert_not @guide.valid?
  end

  test 'guide should require a description' do
    @guide.description = ''
    assert_not @guide.valid?
  end

  test 'guide should require a location' do
    @guide.destination = nil
    assert_not @guide.valid?
  end

  test 'guide should have a user' do
    @guide.user = nil
    assert_not @guide.valid?
  end

  test 'guides should be able to have recommendations attached' do
    @guide.recommendations.create! title: 'Hello', content: 'World', place: places(:one), user: users(:michael)
    assert @guide.recommendations.first.valid?
    assert @guide.valid?
  end
end
