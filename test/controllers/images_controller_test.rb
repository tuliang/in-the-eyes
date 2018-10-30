require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test "should get index" do
    get images_url
    assert_redirected_to new_user_session_path
  end

  test "should get new" do
    get new_image_url
    assert_redirected_to new_user_session_path
  end

  test "should create image" do
    post images_url, params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to new_user_session_path
  end

  test "should show image" do
    get image_url(@image)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_url(@image)
    assert_redirected_to new_user_session_path
  end

  test "should update image" do
    patch image_url(@image), params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to new_user_session_path
  end

  test "should destroy image" do
    delete image_url(@image)
    assert_redirected_to new_user_session_path
  end
end
