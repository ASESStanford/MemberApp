class ApplicationSubmissionController < ApplicationController
  before_action :authenticate_user!

  def index
    @apps = ApplicationSubmission.all
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
    answers = answer_set_params
    answers.each do |id, text|
      Answer.find(id).update(text: text)
    end
    if params[:commit] == "Submit"
      ApplicationSubmission.update(params[:id], :submitted => true)
    end
    redirect_to edit_application_submission_url(params[:id])
  end

  def destroy
  end

  def show
    @app = ApplicationSubmission.find(params[:id]).grab_qas
  end

  private
    def answer_set_params
      params.require(:answers)
    end
end
