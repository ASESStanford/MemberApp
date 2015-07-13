class Interview < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'interviewer_id'
  belongs_to :user, :foreign_key => 'applicant_id'
end
