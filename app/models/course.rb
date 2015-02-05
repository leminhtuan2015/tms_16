class Course < ActiveRecord::Base
	has_many :enrollment
	has_many :course_subject

	belong_to :supervisor
end
