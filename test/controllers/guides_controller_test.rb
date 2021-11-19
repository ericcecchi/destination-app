require "test_helper"

class GuidesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @locale = locales(:one)
    @user = users(:michael)
  end

  test "should get new when logged in" do
    log_in_as @user
    get new_guide_url
    assert_response :success
  end

  test "should redirect guide page when user is not logged in" do
    get new_guide_url
    assert_redirected_to login_url
  end

  test "should redirect create guide when user is not logged in" do
    assert_no_difference 'Guide.count' do
      post guides_url, params: { guide: { title: 'Lorem ipsum', description: 'My new guide', locale_id: 1 } }
    end

    assert_redirected_to login_url
  end

  test "should create a guide" do
    log_in_as @user
    assert_difference 'Guide.count' do
      post guides_url, params: { guide: { locale_id: @locale.id, title: 'Some guide', description: 'Some guide description' } }
    end

    assert_redirected_to @user
  end
end
