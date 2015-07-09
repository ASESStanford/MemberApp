class ApplicationSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :application_form
  has_many :answers

  def applicant_name
    return user.name
  end

  def matching_qs
  	return Question.where(application_form_id: self.application_form_id)
  end

  def init_answers
  	#go through and create answers for every existing question in app form
  	all_questions = matching_qs
  	all_questions.each do |q|
  		answers.create(question_id:q.id, text: "") if !self.answers.pluck(:question_id).include?(q.id)
  	end
  end

  def grab_qas
    init_answers if answers.size != application_form.questions.size
    data = self.answers.map{|a| {a.question => a}} 
    return data
  end

end
