class Task < ActiveRecord::Base
	belong_to :subject
	has_many :enrollment_task
end
