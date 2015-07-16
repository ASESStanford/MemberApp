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
    if params[:round] #change round
      round_num = round_params.keys[0].to_i
      app = ApplicationSubmission.find(params[:id])
      app.update(round: round_num)
      # user_email = app.user.email
      # if round_num == 0
      #   Postman.reject_email(user_email).deliver
      # elsif round_num == 2
      #   Postman.first_round_email(user_email).deliver
      # end
    else
      answers = answer_set_params
      answers.each do |id, text|
        Answer.find(id).update(text: text)
      end
    end
    if params[:commit] == "Submit"
      ApplicationSubmission.update(params[:id], :submitted => true)
    end
    redirect_to edit_application_submission_url(params[:id])
  end

  def destroy
  end

  def show

    @application_submission = ApplicationSubmission.find(params[:id])
    @questions_and_answers = @application_submission.grab_qas
    @user_rating = @application_submission.rating_for(current_user)
    if @user_rating == nil
      @user_rating = @application_submission.written_ratings.create(user_id: current_user.id)
    end
    @user = @application_submission.user
  end

  private
    def answer_set_params
      params.require(:answers)
    end
    def round_params
      params.require(:round)
    end
end
