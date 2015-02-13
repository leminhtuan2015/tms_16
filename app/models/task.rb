class Task < ActiveRecord::Base
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :users, through: :enrollment_tasks
  has_many :activities, :dependent => :destroy

  belongs_to :subject

  validates :name,  presence: true, length: {maximum: 50}
end