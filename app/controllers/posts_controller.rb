class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  expose(:posts)
  expose(:post, attributes: :post_params)
  expose(:comment) { Comment.new }

  def index
    query_param = params[:query]
    if query_param && query_param != ""
      @posts = Post.search_by_title(query_param).order(created_at: :desc)
    else
      @posts = Post.all
    end
  end

  def create
    post.user = current_user
    post.tag_list.add(post.tags.split(" "))
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
    if post.user != current_user
      post.liked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to post }
      format.json { render json: { id: post.id, votes: post.total_votes } }
    end
  end

  def downvote
    if post.user != current_user
      post.disliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to post }
      format.json { render json: { id: post.id, votes: post.total_votes } }
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :url, :tags)
    end

end

