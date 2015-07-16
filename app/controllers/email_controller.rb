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

  private
    def email_params
      params.require(:email).permit(:subject, :body)
    end
end
