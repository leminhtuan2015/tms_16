class CreateEnrollmentSubjects < ActiveRecord::Migration
  def change
    create_table :enrollment_subjects do |t|

      t.timestamps null: false
    end
  end
end