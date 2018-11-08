require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:demo)
  end

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get pictures" do
    get pictures_path
    assert_response :success
  end

  test "should get photos" do
    get photos_path
    assert_response :success
  end

  test "should get emoticons" do
    get emoticons_path
    assert_response :success
  end
end
