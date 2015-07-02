class ApplicationSubmissionController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
	current_user.init_application if !current_user.application_submission
	redirect_to application_submission_edit_url
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
