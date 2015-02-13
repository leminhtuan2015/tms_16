class Course < ActiveRecord::Base
  has_many :enrollments, :dependent => :destroy
  has_many :users, through: :enrollments
  has_many :enrollment_subjects, :dependent => :destroy
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :course_subjects, :dependent => :destroy
  has_many :subjects, through: :course_subjects
  has_many :activities, :dependent => :destroy

  validates :name,  presence: true, length: {maximum: 50}
  validates :description,  presence: true
end