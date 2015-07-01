class ApplicationSubmissionController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
  	app = current_user.application_submission
  	if app
  		#app exists, redirect to edit directly
  		redirect_to application_submission_edit_url
  	else
  		current_user.init_application
  		redirect_to application_submission_edit_url
  	end
  end

  def edit
  	@application_submission = ApplicationSubmission.find(params[:id])
  	@questions_and_answers = @application_submission.grab_qas
  end
end
