class ApplicationSubmission < ActiveRecord::Base
  belongs_to :user
  belongs_to :application_form
  has_many :written_ratings
  has_many :answers

  def applicant_name
    return user.name
  end

  

  def has_been_rated_by(user)
    rating = written_ratings.find_by_user_id(user)
    return false if rating == nil
    return false if rating[:rating] == nil
    return true
  end

  def avg_written_rating
    sum_rating = written_ratings.inject(0) do |sum, x| 
      sum = x[:rating].to_i + sum if x 
    end
    if written_ratings.empty?
      return 0
    else
      return sum_rating / written_ratings.size
    end
  end

  def rating_for(user)
    return written_ratings.find_by_user_id(user.id)
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
