class ApplicationFormController < ApplicationController
  before_action :authenticate_user!

  def index
  	redirect_to welcome_index_path if !current_user.is_admin?
  	@forms = current_user.application_forms
  end

  def show
  	@form = ApplicationForm.find(params[:id])
  	@form_questions = {id: @form.id, questions: @form.questions, title: @form.title}
  	@question = Question.new
  end

  def edit
  end

  def new
    @form = ApplicationForm.new

  end

  def create
    @form = ApplicationForm.create(app_form_params)
    @form.user_id = current_user.id
    @form.save
    redirect_to application_form_path(@form.id)
  end

  def destroy
  	if f = ApplicationForm.find(params[:id])
  		f.destroy
  	end
  	redirect_to application_form_index_path
  end
  
  def update
  	q = ""
  	if app_form_params.has_key?("title") #app
  		q = ApplicationForm.find(params[:id])
  	elsif app_form_params.has_key?("text") #question
  		q = Question.find(params[:id])
  	end
  	q.update!(app_form_params)
  	redirect_to :back
  	
  end

  private
  	def app_form_params
  		if params.has_key?("application_form")
  			params.require(:application_form).permit(:title)
  		elsif params.has_key?("question")
  			params.require(:question).permit(:text, :application_form_id)
  		end
  		
  	end
end
