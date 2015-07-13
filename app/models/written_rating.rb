class WrittenRating < ActiveRecord::Base
  belongs_to :application_submission
  belongs_to :user
end
