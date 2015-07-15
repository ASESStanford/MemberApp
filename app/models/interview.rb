class Interview < ActiveRecord::Base
  belongs_to :user, foreign_key: 'interviewer_id'
  belongs_to :user, foreign_key: 'applicant_id'

  def get_nil_interviewer
  	return Interview.where(interviewer_id: nil)
  end

  def get_nil_applicant
  	return Interview.where(applicant_id: nil)
  end

  def belong_to_interviewer(id)
  	return Interview.where(interviewer_id: id)
  end

  def belong_to_applicant(id)
  	return Interview.where(applicant_id: id)
  end

  def interviewer
  	return nil if interviewer_id == nil
  	return User.find(interviewer_id)
  end

  def applicant
  	return nil if applicant_id == nil
  	return User.find(applicant_id)
  end

  def interviewer_name
  	return "" if interviewer_id == nil
  	return User.find(interviewer_id).name
  end

  def applicant_name
  	return "" if applicant_id == nil
  	return User.find(applicant_id).name
  end
end
