class EnrollmentSubject < ActiveRecord::Base
	belongs_to :user
	belongs_to :course_subject
	belongs_to :enrollment

	has_many :enrollment_task
end
