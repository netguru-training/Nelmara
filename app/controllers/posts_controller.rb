class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  expose(:posts)
  expose(:post, attributes: :post_params)
  expose(:comment) { Comment.new }

  def index
    if user_signed_in?
      self.posts = Post.tagged_with(current_user.tags)
    end
    query_param = params[:query]
    if query_param && query_param != ""
      self.posts = posts.search_by_title(query_param).order(created_at: :desc)
    end
    self.posts = posts.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def all
    self.posts = Post.all
    query_param = params[:query]
    if query_param && query_param != ""
      self.posts = posts.search_by_title(query_param).order(created_at: :desc)
    end
    self.posts = posts.paginate(page: params[:page])
    render 'index'
  end

  def create
    post.user = current_user
    post.tag_list.add(post.tags.split(" "))
    post.save
    redirect_to root_path
  end

  def edit
    authorize post, :update?
  end

  def update
    authorize post
    if post.save
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  def upvote
    authorize post, :vote?
    if post.user != current_user
      post.liked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to post }
      format.json { render json: { id: post.id, votes: post.decorate.total_votes } }
    end
  end

  def downvote
    authorize post, :vote?
    if post.user != current_user
      post.disliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_to post }
      format.json { render json: { id: post.id, votes: post.decorate.total_votes } }
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :url, :tags, :image)
    end

end

