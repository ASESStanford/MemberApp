class QuestionController < ApplicationController
  def review
  	all_forms = ApplicationForm.all
  	@form_questions = all_forms.map{|f| {id: f.id, questions: f.questions, title: f.title}}
  	@question = Question.new
  end

  def create
  	Question.create(question_params)
  	redirect_to question_review_url
  end

  def show
  end

  def destroy
  	if @q = Question.find(params[:id])
  		@q.destroy
  	end
  	redirect_to question_review_url
  end

  def update
  	q = Question.find(params[:id])
  	q.update!(question_params)
  	redirect_to question_review_url
  end

  private
  	def question_params
  		params.require(:question).permit(:text, :application_form_id)
  	end
end
