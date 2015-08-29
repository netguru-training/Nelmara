class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create 
    submission = Submission.new(submission_params)
    submission.save
    redirect_to root_path
  end

  private
    def submission_params
      params.require(:submission).permit(:title, :body, :url)
    end
end
