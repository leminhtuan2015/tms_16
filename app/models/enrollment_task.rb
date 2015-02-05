class EnrollmentTask < ActiveRecord::Base
	belongs_to :user
	belongs_to :task
	belongs_to :enrollment_subject

end
