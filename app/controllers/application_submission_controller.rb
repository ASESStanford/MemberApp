class ApplicationSubmissionController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    cur = current_user.application_submission
    if cur == nil
      cur = current_user.init_application
    end
	  redirect_to edit_application_submission_url(cur.id)
  end

  def edit
  	@application_submission = ApplicationSubmission.find(params[:id])
  	@questions_and_answers = @application_submission.grab_qas
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
  end
end
