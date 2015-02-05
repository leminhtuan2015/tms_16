class CourseSubject < ActiveRecord::Base
	has_many :enrollment_subject

	belong_to :course
	belong_to :subject
end
