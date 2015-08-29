class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  expose(:post)
  expose(:comments, ancestor: :post)
  expose(:comment, attributes: :comment_params)

  # POST /comments
  # POST /comments.json
  def create
    if comment.save
      redirect_to post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
