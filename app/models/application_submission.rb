class ApplicationSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :application_form
  has_many :answers

  def self.grab_qas
	data = self.answers.map{|a| {a.question : a}} 
  end

  def self.matching_qs
  	return Question.where(application_form_id: self.application_form_id)
  end

  def self.init_answers
  	#go through and create answers for every existing question in app form
  end

end
