class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  expose(:posts)
  expose(:post, attributes: :post_params)
  expose(:comment) { Comment.new }

  def create
    post.user = current_user
    post.save
    redirect_to root_path
  end

  def update
    if post.save
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  def upvote
    post.liked_by current_user
    respond_to do |format|
      format.html { redirect_to post }
      format.json { render json: post.total_votes }
    end    
  end

  def downvote
    post.disliked_by current_user
    respond_to do |format|
      format.html { redirect_to post }
      format.json { render json: post.total_votes }
    end   
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :body, :url)
    end
end
