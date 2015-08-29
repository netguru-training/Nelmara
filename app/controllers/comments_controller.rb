class CommentsController < ApplicationController
  expose(:post)
  expose(:comments, ancestor: :post)
  expose(:comment, attributes: :comment_params)

  def create
    if comment.save
      redirect_to params[:comment][:redirect] || post, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    comment.body = t('comment.destroy_msg', user: current_user.username)
    if comment.save
      redirect_to post_url(post), notice: 'Comment was successfully destroyed.'
    else
      redirect_to post_url(post)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end

