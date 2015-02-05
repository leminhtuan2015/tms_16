class Subject < ActiveRecord::Base
	has_many :course_subject
	has_many :task
end
