require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: "#{rand(50000)}@example.com", password: "password")

    @image = images(:demo)
    @image.user_id = @user.id
    @image.save

    @other = images(:other)
  end

  test "should get index" do
    # use guest
    get images_path
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    get images_path
    assert_response :success
  end

  test "should get new" do
    # use guest
    get new_image_path
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    get new_image_path
    assert_response :success
  end

  test "should create image" do
    # use guest
    post images_path, params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    post images_path, params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to image_path(Image.last)
  end

  test "should show image" do
    get image_path(@image)
    assert_response :success
  end

  test "should get edit" do
    # use guest
    get edit_image_path(@image)
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    get edit_image_path(@image)
    assert_response :success

    # member edit other
    get edit_image_path(@other)
    assert_redirected_to root_path
  end

  test "should update image" do
    # use guest
    patch image_path(@image), params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    patch image_path(@image), params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to image_path(@image)

    # member update other
    patch image_path(@other), params: { image: { image_type: @image.image_type, title: @image.title } }
    assert_redirected_to root_path
  end

  test "should destroy image" do
    # use guest
    delete image_path(@image)
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    delete image_path(@image)
    assert_redirected_to images_path

    # member update other
    delete image_path(@other)
    assert_redirected_to root_path
  end
end
