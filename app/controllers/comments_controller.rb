class CommentsController < ApplicationController
  before_action :authenticate_user!

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to image_path(@comment.image_id), notice: '评论成功'.freeze }
        format.js
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to image_path(@comment.image_id), alert: '评论内容不能为空'.freeze }
        format.js { flash[:alert] = '评论内容不能为空'.freeze }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :image_id)
    end
end
