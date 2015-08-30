class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :all, :show]
  before_action :set_posts, only: [:index, :all]
  expose(:posts)
  expose(:post, attributes: :post_params)
  expose(:tags) { ActsAsTaggableOn::Tag.all.order(taggings_count: :desc) }
  expose(:comment) { Comment.new }

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  def all
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

    def index_action?
      params[:action] == 'index'
    end

    def post_params
      params.require(:post).permit(:title, :body, :url, :tags, :image)
    end

    def query_param
      params[:query]
    end

    def set_posts
      self.posts = posts.search_by_title(query_param) if query_param.present?
      self.posts = posts.tagged_with(current_user.tags, any: true) if user_signed_in? && index_action?
      self.posts = posts.includes(:user, :comments).paginate(page: params[:page])
    end

end

