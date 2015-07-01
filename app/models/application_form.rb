class ApplicationForm < ActiveRecord::Base
	has_many :application_submissions
	has_many :questions
end
