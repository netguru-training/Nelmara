class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  expose(:tagname) { params[:tag] }
  expose(:posts) { Post.tagged_with(tagname) }
  expose(:comment) { Comment.new }

  def show
    if params[:best] then
      self.posts = posts.by_best
    else 
      self.posts = posts.by_new
    end
  end

  def subscribe 
    current_user.subscribe(tagname)
    redirect_to tag_path(tagname)
  end

  def unsubscribe 
    current_user.unsubscribe(tagname)
    redirect_to tag_path(tagname)
  end
end
