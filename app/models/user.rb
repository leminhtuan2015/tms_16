class User < ActiveRecord::Base
	has_many :enrollment
	has_many :enrollment_subject
	has_many :enrollment_task
end
