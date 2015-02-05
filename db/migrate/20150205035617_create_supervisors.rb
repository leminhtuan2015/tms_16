class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image
      t.date :dob
      t.timestamps
    end
  end
end
