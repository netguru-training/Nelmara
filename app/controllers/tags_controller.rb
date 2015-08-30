class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  expose(:tagname) { params[:tag] }
  expose(:posts) { Post.tagged_with(tagname) }
  expose(:comment) { Comment.new }

  def subscribe 
    current_user.subscribe(tagname)
    redirect_to tag_path(tagname)
  end

  def unsubscribe 
    current_user.unsubscribe(tagname)
    redirect_to tag_path(tagname)
  end
end
