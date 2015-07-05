class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :application_submission
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.init_application
  	return self.create_application_submission(application_form_id:1)
  end

  def self.has_application?
  	return ApplicationSubmission.where(user_id: id) == nil
  end

end
