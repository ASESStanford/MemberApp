class Answer < ActiveRecord::Base
  belongs_to :application_submission
  belongs_to :question
end
