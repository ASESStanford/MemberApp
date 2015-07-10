class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :application_submission
  has_many :written_ratings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def init_application
  	return self.create_application_submission(application_form_id:1)
  end

  def self.has_application?
  	return ApplicationSubmission.where(user_id: id) == nil
  end

  def is_admin?
    return role == 2
  end

  def is_reviewer?
    return role == 1
  end

  def is_applicant?
    return role == 0
  end
end
