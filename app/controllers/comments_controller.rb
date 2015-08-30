class CommentsController < ApplicationController
  expose(:post)
  expose(:comments, ancestor: :post)
  expose(:comment, attributes: :comment_params)

  def create
    comment.user = current_user
    if comment.save
      respond_to do |format|
        format.html { redirect_to params[:comment][:redirect] || post, notice: 'Comment was successfully created.' }
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    comment.body = t('comment.destroy_msg', user: current_user.username)
    if comment.save
      respond_to do |format|
        format.html { redirect_to post_url(post), notice: 'Comment was successfully destroyed.' }
        format.js 
      end
    else
      redirect_to post_url(post)
    end
  end

  def upvote
    if comment.user != current_user
      comment.liked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to comment.post }
      format.json { render json: { id: comment.id, votes: comment.decorate.total_votes } }
    end
  end

  def downvote
    if comment.user != current_user
      comment.disliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to comment.post }
      format.json { render json: { id: comment.id, votes: comment.decorate.total_votes } }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end

