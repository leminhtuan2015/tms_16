class CreateEnrollmentTasks < ActiveRecord::Migration
  def change
    create_table :enrollment_tasks do |t|

      t.timestamps
    end
  end
end
