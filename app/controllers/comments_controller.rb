class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  expose(:post) { comment.post }
  expose(:comments)
  expose(:comment, attributes: :comment_params)

  # POST /comments
  # POST /comments.json
  def create
    respond_to do |format|
      if comment.save
        format.html { redirect_to [comment, post], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if comment.update(comment_params)
        format.html { redirect_to comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: comment }
      else
        format.html { render :edit }
        format.json { render json: comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end