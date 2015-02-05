class CreateEnrollmentTasks < ActiveRecord::Migration
  def change
    create_table :enrollment_tasks do |t|
      t.date :begin
      t.date :end

      t.timestamps null: false
    end
  end
end
