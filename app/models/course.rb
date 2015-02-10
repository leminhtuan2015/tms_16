class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :enrollment_subjects
  has_many :enrollment_tasks
  has_many :course_subjects
  has_many :activities
  has_many :subjects, :through => :course_subjects
  has_many :users, :through => :enrollments

  accepts_nested_attributes_for :course_subjects,
                                                     :allow_destroy => true
end