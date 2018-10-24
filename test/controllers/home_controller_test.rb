require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get pictures" do
    get pictures_url
    assert_response :success
  end
end
