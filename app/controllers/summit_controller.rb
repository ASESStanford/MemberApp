class SummitController < ApplicationController
  def store_summit_answer(submission, id, value)
  	q = Question.find(id.to_i)
  	a = Answer.new
  	a.text = value
  	a.question = q
  	a.application_submission = submission
  	a.save
  end

  def send_confirmation_email(email)
    postmark(email, subject, body)

  def create
  	summit_form_id = 1

  	u = User.new
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
        send_confirmation_email(u.email)
  		else
  			redirect_to :back
  		end
  	end
  end

  def new
  	@user = User.new
  	@app_sub = ApplicationSubmission.new
  end
end
