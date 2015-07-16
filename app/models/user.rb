class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :application_submission
  has_many :written_ratings
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  has_attached_file :resume
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_attachment_size :resume, :less_than => 10.megabytes    
  validates_attachment_content_type :resume, :content_type =>['application/pdf'], :message => ', Only PDF files are allowed. '

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
