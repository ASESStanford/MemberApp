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
    u = User.new
    u.password = SecureRandom.hex(8)
    u.name = params[:user]["first_name"] + " " + params[:user]["last_name"]
    u.email = params[:user]["email"]
    u.resume = params[:user]["resume"]
    u.image = params[:user]["image"]
    print u
    if u.save!
      print "save"
      a = ApplicationSubmission.new
      a.user = u
      a.application_form_id = summit_form_id
      params[:summit].each do |id, val|
        store_summit_answer(a, id, val)
      end
      if a.save
        # this doesn't work because of Google's increased security, need to figure out another way
        # Postman.app_submission_email(params[:user]["email"], params[:user]["first_name"]).deliver
        flash[:success] = "Your application has been submitted."
        redirect_to :action => 'new'
      else
        redirect_to :back
      end
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
