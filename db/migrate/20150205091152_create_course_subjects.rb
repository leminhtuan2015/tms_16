class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.date :begin
      t.date :end

      t.timestamps null: false
    end
  end
end
