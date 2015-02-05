class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
