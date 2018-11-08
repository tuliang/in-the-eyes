require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should create comment" do
    # use guest
    post comments_url, params: { comment: { content: @comment.content, image_id: @comment.image_id } }
    assert_redirected_to new_user_session_path
  end
end
