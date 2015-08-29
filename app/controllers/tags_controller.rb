class TagsController < ApplicationController
  expose(:tagname) { params[:tag] }
  expose(:posts) { Post.tagged_with(tagname) }
  expose(:comment) { Comment.new }
end
