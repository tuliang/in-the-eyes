require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = User.create!(email: "#{rand(50000)}@example.com", password: "password")

    @image = images(:demo)
    @image.user_id = @user.id
    @image.save

    @comment = comments(:one)
  end

  test "should create comment" do
    # use guest
    post comments_path, params: { comment: { content: @comment.content, image_id: @image.id } }
    assert_redirected_to new_user_session_path

    # use member
    sign_in @user
    post comments_path, params: { comment: { content: @comment.content, image_id: @image.id } }
    assert_redirected_to image_path(@image.id)

    # use member comment null
    sign_in @user
    post comments_path, params: { comment: { content: '', image_id: @image.id } }
    assert_redirected_to image_path(@image.id)
  end
end
