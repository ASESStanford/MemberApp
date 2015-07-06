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
    if @application_submission == nil
      redirect_to  new_application_submission_url
    end
  	@questions_and_answers = @application_submission.grab_qas
  end

  def create
  end

  def update
    answers = answer_set_params
    answers.each do |id, text|
      Answer.find(id).update(text: text)
    end
    redirect_to edit_application_submission_url(params[:id])
  end

  def destroy
  end

  def show
  end

  private
    def answer_set_params
      params.require(:answers)
    end
end
