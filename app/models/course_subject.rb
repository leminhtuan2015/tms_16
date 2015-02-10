class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  accepts_nested_attributes_for
end