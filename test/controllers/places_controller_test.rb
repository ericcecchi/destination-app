require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @place = places(:one)
  end

  # It's really hard to model a graph,
  # and since we're using place.root,
  # we can't really do this
  # test "should get show" do
  #   get place_url(@place)
  #   assert_response :success
  # end
end
