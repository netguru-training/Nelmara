class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  expose(:posts)
  expose(:post, attributes: :post_params)

  def create
    post.save
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :url)
    end
end

