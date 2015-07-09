class Question < ActiveRecord::Base
  belongs_to :application_form
  has_many :answers, dependent: :destroy
end
