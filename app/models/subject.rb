class Subject < ActiveRecord::Base
  has_many :enrollment_subjects
  has_many :enrollment_tasks
  has_many :course_subjects
  has_many :activities
  has_many :tasks

  accepts_nested_attributes_for :course_subjects,
                                                     :allow_destroy => true
end