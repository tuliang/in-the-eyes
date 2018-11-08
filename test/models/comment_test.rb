require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "comment validates" do
    comment = Comment.new

    assert comment.invalid?
    assert comment.errors[:content].any?
  end

  test "comment validates content" do
    comment = Comment.new(content: '')

    assert comment.invalid?
    assert comment.errors[:content].any?
  end
end
