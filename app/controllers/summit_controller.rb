class SummitController < ApplicationController
  after_action :allow_iframe
  def store_summit_answer(submission, id, value)
    q = Question.find(id.to_i)
    a = Answer.new
    a.text = value
    a.question = q
    a.application_submission = submission
    a.save
  end

  def create
    require 'securerandom'
    summit_form_id = 1
    # delete old application & user if exists
    old_user = User.where(:email => params[:user]["email"]).first
    if old_user
      old_application = ApplicationSubmission.where(:user_id => old_user.id).first
      if old_application
        old_answers = Answer.where(:application_submission_id => old_application.id)
        old_answers.each do |a|
          a.destroy
        end
        old_application.destroy
      end
      old_user.destroy
    end

    u = User.new
    u.password = SecureRandom.hex(8)
    u.name = params[:user]["first_name"] + " " + params[:user]["last_name"]
    u.email = params[:user]["email"]
    u.resume = params[:user]["resume"]
    u.image = params[:user]["image"]
    
    if u.save
      a = ApplicationSubmission.new
      a.user = u
      a.application_form_id = summit_form_id
      params[:summit].each do |id, val|
        store_summit_answer(a, id, val)
      end
      if a.save
        # this doesn't work because of Google's increased security, need to figure out another way
        # Postman.app_submission_email(params[:user]["email"], params[:user]["first_name"]).deliver
        flash[:success] = "Great job! Your application has been submitted."
        redirect_to :action => 'new'
      else
        flash[:error] = "There is an error. Please email us."
        redirect_to :action => 'new'
      end
    else
      flash[:error] = "Check your resume and headshot are the right format."
      redirect_to :action => 'new'
    end
  end

  def new
    @user = User.new
    @app_sub = ApplicationSubmission.new
  end

private
  def allow_iframe
    response.headers['X-Frame-Options'] = 'ALLOWALL'
  end
end
