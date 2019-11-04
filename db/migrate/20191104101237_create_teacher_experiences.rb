class CreateTeacherExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_experiences do |t|
      t.references :user, foreign_key: true
      t.string :studio_name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps
    end
  end
end
