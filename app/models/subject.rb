class Subject < ActiveRecord::Base
  has_many :user, through: :enrollment_subjects
  has_many :enrollment_subjects, :dependent => :destroy
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :course_subjects, :dependent => :destroy
  has_many :activities, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  validates :name,  presence: true, length: {maximum: 50}
  validates :description,  presence: true
end