class Task < ActiveRecord::Base
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :users, through: :enrollment_tasks
  has_many :activities, :dependent => :destroy

  belongs_to :subject

  validates :name,  presence: true, length: {maximum: 50}

  def status(user, course)
    self.enrollment_tasks.find_by(user_id: user.id, course_id: course.id).status
  end
end