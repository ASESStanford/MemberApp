class ApplicationForm < ActiveRecord::Base
	has_many :application_submissions
	has_many :questions
	belongs_to :user
end
