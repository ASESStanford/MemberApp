class EmailController < ApplicationController
  def index
    @emails = Email.all
    @email = Email.new
  end

  def show
  end

  def new
  end

  def create
    Email.create(email_params)
    redirect_to :back
  end

  def edit
  end

  def update
    e = Email.find(params[:id])
    e.update!(email_params)
    redirect_to :back
  end

  def destroy
    if @e = Email.find(params[:id])
      @e.destroy
    end
    redirect_to :back
  end

  def choose
    @email = Email.find(params[:id])
    @submissions = ApplicationSubmission.all.group_by(&:round)
  end

  def preview
    @email = Email.find(params[:id])
    @submissions = ApplicationSubmission.where(round: params[:email][:round])
    @round = params[:email][:round]
  end

  def send_email
    email = Email.find(params[:id])
    submissions = ApplicationSubmission.where(round: params[:email][:round])
    mail(email, submissions)
    redirect_to email_index_path
  end

  private
    def email_params
      params.require(:email).permit(:subject, :body)
    end
    def mail(email, submissions)
      submissions.each do |s|
        postmark(s.user.email, 
          view_context.substitute_name(email.subject, s.user), 
          view_context.substitute_name(email.body, s.user))
      end
    end
    def postmark(to, subject, body)
      puts to
      puts subject
      puts body
    end
end
