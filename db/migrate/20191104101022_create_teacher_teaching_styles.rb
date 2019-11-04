class CreateTeacherTeachingStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_teaching_styles do |t|
      t.references :user, foreign_key: true
      t.references :teaching_style, foreign_key: true

      t.timestamps
    end
  end
end
